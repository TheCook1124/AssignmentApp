import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class postDisplay extends StatefulWidget {
  final DocumentSnapshot documentsnapshot;

  const postDisplay({Key? key, required this.documentsnapshot})
      : super(key: key);

  @override
  _postDisplayState createState() => _postDisplayState();
}

class _postDisplayState extends State<postDisplay> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    final DocumentSnapshot ds = widget.documentsnapshot;
    controller = VideoPlayerController.network(ds.get('URL'));
    controller!.initialize().then((_) {
      setState(() {
        controller!.setLooping(true);
        controller!.play();
      });
    });
  }

  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DocumentSnapshot ds = widget.documentsnapshot;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            CircleAvatar(backgroundImage: NetworkImage(ds['dp'])),
            SizedBox(
              width: 10,
            ),
            Text(
              ds['username'],
              style: TextStyle(fontSize: 15),
            ),
          ]),
        ),
        (ds['media'] == 'image')
            ? SizedBox(
                height: 300,
                child:
                    Image.network(ds.get('URL').toString(), fit: BoxFit.cover))
            : Container(
                height: controller!.value.size.height,
                width: controller!.value.size.width,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      final controller = this.controller;
                      if (controller != null)
                        controller.value.isPlaying
                            ? controller.setVolume(0)
                            : controller.setVolume(100);
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      final controller = this.controller;
                      if (controller != null)
                        controller.value.isPlaying
                            ? controller.play()
                            : controller.pause();
                    });
                  },
                  child: VideoPlayer(controller!),
                ),
              ),
        Row(
          children: [
            likes(),
            Icon(Icons.insert_comment_outlined),
            SizedBox(width: 10),
            Icon(EvaIcons.paperPlaneOutline),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                ds['likes'].length.toString() + ' Likes',
                style: TextStyle(fontSize: 17),
              )),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(ds.get('username'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      ds['caption'],
                      maxLines: null,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                readTimestamp(ds['timestamp']),
                style: TextStyle(color: Colors.grey),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 0,
        )
      ],
    );
  }

  String readTimestamp(Timestamp timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = timestamp.toDate();
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'd';
      } else {
        time = diff.inDays.toString() + 'd';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + 'w';
      } else {
        time = (diff.inDays / 7).floor().toString() + 'w';
      }
    }

    return time;
  }

  Widget likes() {
    final ds = widget.documentsnapshot;
    final likes = <String>[
      ...ds.get('likes')
    ]; //'...' is used to copy the list into another list
    return IconButton(
      icon: (likes.contains(FirebaseAuth.instance.currentUser!.uid))
          ? Icon(
              EvaIcons.heart,
              color: Colors.red,
            )
          : Icon(EvaIcons.heartOutline),
      onPressed: () async {
        if (likes.contains(FirebaseAuth.instance.currentUser!.uid))
          likes.remove(FirebaseAuth.instance.currentUser!.uid);
        else
          likes.add(FirebaseAuth.instance.currentUser!.uid);
        await FirebaseFirestore.instance.collection("post").doc(ds.id).update({
          'likes': likes,
        });
      },
    );
  }
}
