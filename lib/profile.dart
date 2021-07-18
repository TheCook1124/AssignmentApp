import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:appnew/main.dart';
import 'package:appnew/bottomnav.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Icon(Icons.lock),
          Text(
            "Ben",
            style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.keyboard_arrow_down),
        ]),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://uifaces.co/our-content/donated/LpiGpOEC.jpg'),
                    radius: 50,
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('32', style: TextStyle(fontSize: 20)),
                    Text('Posts', style: TextStyle(fontSize: 15))
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('104', style: TextStyle(fontSize: 20)),
                    Text('Followers', style: TextStyle(fontSize: 15))
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('182', style: TextStyle(fontSize: 20)),
                    Text('Following', style: TextStyle(fontSize: 15))
                  ],
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ben White'),
                Text.rich(TextSpan(
                    text: 'Banker @ credit suisse ',
                    children: [
                      TextSpan(
                          text: '@pixsellz',
                          style: TextStyle(color: Colors.blue))
                    ])),
                Text('Money is everything'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                minWidth: 1000,
                onPressed: () {},
                child: Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(height: 0),
          Expanded(
            child: GridView.builder(
                itemCount: img.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    img[index].url2,
                    fit: BoxFit.cover,
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                )),
          )
        ],
      ),
    );
  }
}

class image {
  final String url2;

  image(this.url2);
}

List<image> img = [
  image(
      'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JvdXB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  image(
      'https://images.unsplash.com/photo-1484589065579-248aad0d8b13?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  image('https://images.unsplash.com/photo-1459257868276-5e65389e2722?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y29mZWV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  image(
      'https://images.pexels.com/photos/111755/pexels-photo-111755.jpeg?cs=srgb&dl=pexels-pattama-choomsree-111755.jpg&fm=jpg'),
  image(
      'https://i.pinimg.com/originals/86/3e/ef/863eef974d1011a0d3c7a2698591bb3e.jpg'),
  image('https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dHJhdmVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
  image(
      'https://parade.com/wp-content/uploads/2019/10/Life-Quotes-Dolly-680x430.jpg'),
  image(
      'https://images.unsplash.com/photo-1520880867055-1e30d1cb001c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZyaWVuZHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  image(
      'https://images.unsplash.com/photo-1488085061387-422e29b40080?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8dHJhdmVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  image('https://miro.medium.com/max/1200/0*s7vGN34hz5jJUYTm.png'),
  image(
      'https://images.unsplash.com/photo-1518605125802-006dcc629439?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2hlbHNlYSUyMGZjfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  image(
      'https://images.unsplash.com/photo-1623521602452-1a7cd695feca?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGNyaWNrZXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
];
