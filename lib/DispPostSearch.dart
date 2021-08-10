import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class displayPostSearch extends StatefulWidget {
  final DocumentSnapshot documentsnapshot;

  const displayPostSearch({Key? key, required this.documentsnapshot})
      : super(key: key);

  @override
  _dispPostSearchState createState() => _dispPostSearchState();
}

class _dispPostSearchState extends State<displayPostSearch> {
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
    return (ds['media'] == 'image')
        ? SizedBox(
            height: 400, child: Image.network(ds.get('URL'), fit: BoxFit.cover))
        : FittedBox(
            fit: BoxFit.cover,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  final controller = this.controller;
                  if (controller != null)
                    controller.value.isPlaying
                        ? controller.setVolume(100)
                        : controller.setVolume(0);
                });
              },
              child: SizedBox(
                height: controller!.value.size.height,
                width: controller!.value.size.width,
                child: VideoPlayer(controller!),
              ),
            ),
          );
  }
}
