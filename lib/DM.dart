import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appnew/main.dart';
import 'package:appnew/Main_page.dart';
import 'package:appnew/DM.dart';

class dm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text(
            "Ben",
            style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.keyboard_arrow_down),
        ]),
        centerTitle: true,
        actions: <Widget>[Icon(Icons.add), SizedBox(width: 10)],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 15),
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    prefixIcon: Icon(Icons.search),
                    fillColor: Color(0xFFCBCBCB),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xFFCBCBCB))),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: DirMes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(DirMes[index].URL),
                      radius: 30,
                    ),
                    title: Text(
                      DirMes[index].name,
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Icon(Icons.camera_alt_outlined),
                    subtitle: Row(
                      children: [
                        SizedBox(
                            width: 110,
                            child: Text(
                              'Hello! How was your trip to Spain?',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            )),
                        SizedBox(width: 55),
                        Text('1d')
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.vertical,
              ),
              //SizedBox(width: 10)
            ),
          ],
        ),
      ),
    );
  }
}

class dms {
  final String name;
  final String url;

  dms(this.url, this.name);
}

List<Story> DirMes= [
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