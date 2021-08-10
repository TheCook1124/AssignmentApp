import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:appnew/log_in.dart';
import 'package:appnew/Sign_up.dart';
import 'package:appnew/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:appnew/bottomnav.dart';
import 'package:video_player/video_player.dart';

class posts extends StatefulWidget {
  const posts({Key? key}) : super(key: key);

  @override
  _postsState createState() => _postsState();
}

class _postsState extends State<posts> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final Widget? body;

    switch (index) {
      case 0:
        body = addImage();
        break;

      case 1:
        body = addVideo();
        break;

      default:
        body = null;
        break;
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            title: TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 20),
              tabs: [
                Tab(
                  text: 'Upload Photo',
                ),
                Tab(
                  text: 'Upload Video',
                ),
              ],
              onTap: (index) => setState(() => this.index = index),
            )),
        body: body,
      ),
    );
  }
}

class addImage extends StatefulWidget {
  const addImage({Key? key}) : super(key: key);

  @override
  _addImageState createState() => _addImageState();
}

class _addImageState extends State<addImage> {
  File? _image;
  final _picker = ImagePicker();
  final _storage = FirebaseStorage.instance;
  String imageURL = '';
  String _imageURL = '';
  final auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final TextEditingController _caption = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  Future<void> getDocument() async {
    var documentSnapshot = await firestoreInstance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
    setState(() {
      _username.text = documentSnapshot.get('username');
      _imageURL = documentSnapshot.get('profilepic');
    });
  }

  @override
  void initState() {
    super.initState();
    getDocument();
  }

  @override
  Widget build(BuildContext context) {
    if (loading == true) {
      return Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    Future<void> uploadPost() async {
      var documentImage = await firestoreInstance.collection("post").add({
        "caption": _caption.text,
        'uid': auth.currentUser!.uid,
        'username': _username.text,
        'dp': _imageURL,
        'timestamp': Timestamp.now(),
        'time': DateTime.now(),
        'media': 'image',
        'likes': <String>[]
      });

      var snapShot = await _storage
          .ref()
          .child('posts/${documentImage.id}/image')
          .putFile(_image!);

      var downloadURL = await snapShot.ref.getDownloadURL();

      await firestoreInstance
          .collection('post')
          .doc(documentImage.id)
          .update({'URL': downloadURL});
    }

    Future<void> galleryImagePicker() async {
      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      });
    }

    Future<void> cameraImagePicker() async {
      var image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: (_image != null)
                        ? Image.file(
                      _image!,
                      fit: BoxFit.fill,
                    )
                        : Image.network(
                        'https://icon-library.com/images/img-icon/img-icon-0.jpg')),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity - 8,
                  child: TextFormField(
                      controller: _caption,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Caption',
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Caption Cannot Be Blank';
                        else
                          return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: FlatButton(
                          onPressed: () => galleryImagePicker(),
                          child: Text('Gallery',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20)),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.lightBlue,
                                width: 1,
                                style: BorderStyle.solid),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () => cameraImagePicker(),
                        child: Text('Camera',
                            style:
                            TextStyle(color: Colors.black, fontSize: 20)),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.lightBlue,
                              width: 1,
                              style: BorderStyle.solid),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  //height: 50,
                    minWidth: 150,
                    onPressed: () async {
                      if (_image == null) {
                        await ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Please select a photo',
                                    style: TextStyle(color: Colors.blue),
                                    textAlign: TextAlign.center)));
                      } else {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          await uploadPost();
                          setState(() {
                            loading = false;
                          });
                          await ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Post Uploaded',
                                      style: TextStyle(color: Colors.blue),
                                      textAlign: TextAlign.center)));
                          await Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => NavBottom()));
                        }
                      }
                    },
                    child: Text('Post',
                        style:
                        TextStyle(color: Colors.lightBlue, fontSize: 20)),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.lightBlue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class addVideo extends StatefulWidget {
  const addVideo({Key? key}) : super(key: key);

  @override
  _addVideoState createState() => _addVideoState();
}

class _addVideoState extends State<addVideo> {
  File? _video;
  final _picker = ImagePicker();
  final _storage = FirebaseStorage.instance;
  String _imageURL = '';
  final auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final TextEditingController _caption = TextEditingController();
  final TextEditingController _username = TextEditingController();
  VideoPlayerController? controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  Future<void> getDocument() async {
    var documentSnapshot = await firestoreInstance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
    setState(() {
      _username.text = documentSnapshot.get('username');
      _imageURL = documentSnapshot.get('profilepic');
    });
  }

  @override
  void initState() {
    super.initState();
    getDocument();
  }

  @override
  Widget build(BuildContext context) {
    if (loading == true) {
      return Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    Future<void> uploadPost() async {
      var documentVideo = await firestoreInstance.collection("post").add({
        "caption": _caption.text,
        'uid': auth.currentUser!.uid,
        'username': _username.text,
        'dp': _imageURL,
        'timestamp': Timestamp.now(),
        'time': DateTime.now(),
        'media': 'video',
        'likes': <String>[]
      });

      var snapShot = await _storage
          .ref()
          .child('posts/${documentVideo.id}/video')
          .putFile(_video!);

      var downloadURL = await snapShot.ref.getDownloadURL();

      await firestoreInstance
          .collection('post')
          .doc(documentVideo.id)
          .update({'URL': downloadURL});
    }

    Future<void> galleryVideoPicker() async {
      var video = await _picker.pickVideo(source: ImageSource.gallery);
      if (video == null) return;
      setState(() {
        _video = File(video.path);
        controller = VideoPlayerController.file(_video!);
        controller!.initialize().then((_) {
          setState(() {
            controller!.setLooping(true);
            controller!.play();
          });
        });
      });
    }

    Future<void> cameraVideoPicker() async {
      var video = await _picker.pickVideo(source: ImageSource.camera);
      if (video == null) return;
      setState(() {
        _video = File(video.path);
        controller = VideoPlayerController.file(_video!);
        controller!.initialize().then((_) {
          setState(() {
            controller!.setLooping(true);
            controller!.play();
          });
        });
      });
    }

    @override
    void dispose() {
      controller!.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: (_video != null)
                        ? FittedBox(
                      fit: BoxFit.cover,
                      child: GestureDetector(
                        onTap: () {
                          final controller = this.controller;
                          if (controller != null)
                            controller.value.isPlaying
                                ? controller.setVolume(100)
                                : controller.setVolume(0);
                        },
                        child: SizedBox(
                          height: controller!.value.size.height,
                          width: controller!.value.size.width,
                          child: video(),
                        ),
                      ),
                    )
                        : Image.network(
                        'https://icon-library.com/images/img-icon/img-icon-0.jpg')),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity - 8,
                  child: TextFormField(
                      controller: _caption,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Caption',
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Caption Cannot Be Blank';
                        else
                          return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: FlatButton(
                          onPressed: () => galleryVideoPicker(),
                          child: Text('Gallery',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20)),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.lightBlue,
                                width: 1,
                                style: BorderStyle.solid),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () => cameraVideoPicker(),
                        child: Text('Camera',
                            style:
                            TextStyle(color: Colors.black, fontSize: 20)),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.lightBlue,
                              width: 1,
                              style: BorderStyle.solid),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  //height: 50,
                    minWidth: 150,
                    onPressed: () async {
                      if (_video == null) {
                        await ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Please select a video',
                                    style: TextStyle(color: Colors.blue),
                                    textAlign: TextAlign.center)));
                      } else {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          await uploadPost();
                          setState(() {
                            loading = false;
                          });
                          await ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Post Uploaded',
                                      style: TextStyle(color: Colors.blue),
                                      textAlign: TextAlign.center)));
                          await Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => NavBottom()));
                        }
                      }
                    },
                    child: Text('Post',
                        style:
                        TextStyle(color: Colors.lightBlue, fontSize: 20)),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.lightBlue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget video() {
    if (controller == null) {
      return Container();
    }

    return VideoPlayer(controller!);
  }
}