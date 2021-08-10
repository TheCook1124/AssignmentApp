import 'dart:io';
import 'package:appnew/UpdatePassword.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class editprof extends StatefulWidget {
  const editprof({Key? key}) : super(key: key);

  @override
  _editprofState createState() => _editprofState();
}

class _editprofState extends State<editprof> {
  final auth = FirebaseAuth.instance;
  final TextEditingController _emidController = TextEditingController();
  final TextEditingController _uname = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  String? error;
  final firestoreInstance = FirebaseFirestore.instance;
  final _picker = ImagePicker();
  final _storage = FirebaseStorage.instance;
  File? _image;
  String imageURL = "";

  Future<void> getDocument() async {
    var documentSnapshot = await firestoreInstance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
    setState(() {
      _uname.text = documentSnapshot.get('username');
      _emidController.text = documentSnapshot.get('email');
      _bio.text = documentSnapshot.get('bio');
      imageURL = documentSnapshot.get('profilepic');
    });
  }

  @override
  void initState() {
    super.initState();
    getDocument();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> galleryImagePicker() async {
      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      });
    }

    Future<String> uploadImage() async {
      var snapShot = await _storage
          .ref()
          .child('profilpic/${auth.currentUser!.uid}/dp')
          .putFile(_image!);

      var downloadURL = await snapShot.ref.getDownloadURL();

      return downloadURL;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            (_image == null)
                                ? CircleAvatar(
                              radius: 100,
                              backgroundImage: (imageURL.isNotEmpty)
                                  ? NetworkImage(imageURL)
                                  : null,
                            )
                                : CircleAvatar(
                              radius: 100,
                              backgroundImage: FileImage(_image!),
                            ),
                            IconButton(
                                onPressed: () {
                                  galleryImagePicker();
                                },
                                icon: Icon(Icons.edit))
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          controller: _uname,
                          decoration: InputDecoration(
                            hintText: 'Username',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: TextFormField(
                          controller: _bio,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Bio',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              'Email ID:  ',
                              style:
                              TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(_emidController.text,
                                style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                  onPressed: () async {
                                    try {
                                      String uploadImageURL;
                                      if (_image != null) {
                                        uploadImageURL = await uploadImage();
                                      } else {
                                        uploadImageURL = imageURL;
                                      }

                                      await firestoreInstance
                                          .collection("users")
                                          .doc(auth.currentUser!.uid)
                                          .update({
                                        "username": _uname.text,
                                        "bio": _bio.text,
                                        'profilepic': uploadImageURL
                                      });

                                      final querySnapshot =
                                      await firestoreInstance
                                          .collection("post")
                                          .where(
                                          'uid',
                                          isEqualTo:
                                          auth.currentUser!.uid)
                                          .get();
                                      for (final docSnapshot
                                      in querySnapshot.docs) {
                                        await firestoreInstance
                                            .collection('post')
                                            .doc(docSnapshot.id)
                                            .update({
                                          "username": _uname.text,
                                          'dp': uploadImageURL
                                        });
                                      }

                                      Navigator.pop(context);
                                    } catch (e) {
                                      setState(() {
                                        error = '';
                                      });
                                      print(e);
                                    }
                                  },
                                  child: Text('Update',
                                      style: TextStyle(color: Colors.white)),
                                  color: Colors.lightBlue,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel',
                                    style: TextStyle(color: Colors.black)),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.lightBlue,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => changePass()),
                            );
                          },
                          child: Text('Update Password',
                              style: TextStyle(color: Colors.black)),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5))),
                    ]),
              ]),
        ),
      ),
    );
  }
}