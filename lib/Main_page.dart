
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:appnew/Sign_up.dart';
import 'package:appnew/home_page.dart';
import 'package:appnew/log_in.dart';
import 'package:appnew/DM.dart';
class Story {
  String URL;
  String name;

  Story(this.URL, this.name);
}

class Post {
  String ProPic;
  String name;
  String post;

  Post(this.post, this.name, this.ProPic);
}

List<Post> Posts = [
  Post(
      'https://images.unsplash.com/photo-1484589065579-248aad0d8b13?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Ben',
      'https://uifaces.co/our-content/donated/LpiGpOEC.jpg'),
  Post(
      'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JvdXB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Ben',
      'https://uifaces.co/our-content/donated/LpiGpOEC.jpg'),
  Post(
      'https://images.unsplash.com/flagged/photo-1564419188205-4a8e1bc1adc3?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Mackenzie',
      'https://randomuser.me/api/portraits/women/65.jpg'),
  Post(
      'https://images.unsplash.com/flagged/photo-1564419188205-4a8e1bc1adc3?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Mackenzie',
      'https://randomuser.me/api/portraits/women/65.jpg'),
  Post(
      'https://images.unsplash.com/flagged/photo-1564419188205-4a8e1bc1adc3?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Mackenzie',
      'https://randomuser.me/api/portraits/women/65.jpg'),
  Post(
      'https://images.unsplash.com/flagged/photo-1564419188205-4a8e1bc1adc3?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Mackenzie',
      'https://randomuser.me/api/portraits/women/65.jpg'),
  Post(
      'https://images.unsplash.com/flagged/photo-1564419188205-4a8e1bc1adc3?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Mackenzie',
      'https://randomuser.me/api/portraits/women/65.jpg'),
  Post(
      'https://images.unsplash.com/flagged/photo-1564419188205-4a8e1bc1adc3?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Mackenzie',
      'https://randomuser.me/api/portraits/women/65.jpg'),
  Post(
      'https://images.unsplash.com/flagged/photo-1564419188205-4a8e1bc1adc3?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Mackenzie',
      'https://randomuser.me/api/portraits/women/65.jpg'),
  Post(
      'https://images.unsplash.com/flagged/photo-1564419188205-4a8e1bc1adc3?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Mackenzie',
      'https://randomuser.me/api/portraits/women/65.jpg'),
  Post(
      'https://images.unsplash.com/flagged/photo-1564419188205-4a8e1bc1adc3?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'Mackenzie',
      'https://randomuser.me/api/portraits/women/65.jpg'),

];
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

void main() => runApp(MaterialApp(
      home: Mainpage(),
    ));

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.network(
          'https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png',
          width: 400,
          height: 100,
          color: Colors.black,
        ),
        centerTitle: true,
        leading: Icon(
          Icons.camera_alt,
          color: Colors.black,
        ),
        actions: [
          Icon(Icons.tv, color: Colors.black),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => dm()));
            },
            icon: Icon(EvaIcons.paperPlane),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Container(
              height: 500.0,
              child: ListView.builder(
                itemCount: Posts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(Posts[index].ProPic)),
                        title: Text(Posts[index].name),
                      ),
                      SizedBox(height: 5.0),
                      Image.network(Posts[index].post),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('you have liked this post!'),
                                  ),
                                );
                              },
                              icon: Icon(EvaIcons.heartOutline)),
                          Icon(
                            EvaIcons.messageCircle,
                          ),
                          Icon(
                            EvaIcons.paperPlane,
                          ),
                          SizedBox(height: 20),

                        ],
                      ),
                      CircleAvatar(
                          radius: 8.0,
                          backgroundImage: NetworkImage('https://uifaces.co/our-content/donated/LpiGpOEC.jpg'),
                      ),
                      Text('liked by 132 others'),

                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}