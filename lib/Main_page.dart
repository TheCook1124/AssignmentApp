
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appnew/DM.dart';
import 'package:appnew/DisplayPost.dart';
import 'package:video_player/video_player.dart';

class MainPage extends StatelessWidget {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(EvaIcons.camera),
        title: Center(
            child: Text('Instagram',
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Billabong',
                    color: Colors.black))),
        actions: [
          Icon(EvaIcons.tvOutline),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(EvaIcons.paperPlaneOutline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dm()),
              );
            },
          ),
          SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Stories
            Container(
              height: 95,
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: Stories.length,
                itemBuilder: (context, index) {
                  return Row(children: [
                    Column(
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(Stories[index].URL)),
                        Text(
                          Stories[index].name,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(width: 10)
                  ]);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),

            Divider(height: 0),
            Post(),
          ],
        ),
      ),
    );
  }
}

class Story {
  String URL;
  String name;

  Story(this.URL, this.name);
}

List<Story> Stories = [
  Story('https://uifaces.co/our-content/donated/LpiGpOEC.jpg', 'Ben'),
  Story('https://uifaces.co/our-content/donated/kWcZ2tLf.jpg', 'Josh'),
  Story(
      'https://images.unsplash.com/photo-1500649297466-74794c70acfc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=bfc3d05aa60acb5ef0e58c1ac5eb6463',
      'luke'),
  Story('https://randomuser.me/api/portraits/men/86.jpg', 'Rajesh'),
  Story('https://uifaces.co/our-content/donated/4NbH-5h3.jpg', 'Malik'),
  Story(
      'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200',
      'Rohit'),
  Story(
      'https://images.pexels.com/photos/672445/pexels-photo-672445.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
      'Yoko'),
  Story('https://i.imgur.com/ztMTpBt.jpg', 'Christine'),
  Story('https://randomuser.me/api/portraits/women/65.jpg', 'Mackenzie')
];


class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _postState createState() => _postState();
}

class _postState extends State<Post> {
  final firestoreInstance = FirebaseFirestore.instance;
  VideoPlayerController? controller;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreInstance.collection('post').orderBy('timestamp', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int i;
          int index = snapshot.data!.docs.length;
          List<Widget> children = [];
          for (i = 0; i < index; i++) {
            DocumentSnapshot ds = snapshot.data!.docs[i];
            Widget child = postDisplay(documentsnapshot: ds);
            children.add(child);
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

