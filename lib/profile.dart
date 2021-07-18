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
            "Cristine",
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
                        'https://uifaces.co/our-content/donated/3799Ffxy.jpeg'),
                    radius: 50,
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('54', style: TextStyle(fontSize: 20)),
                    Text('Posts', style: TextStyle(fontSize: 15))
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('834', style: TextStyle(fontSize: 20)),
                    Text('Followers', style: TextStyle(fontSize: 15))
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('162', style: TextStyle(fontSize: 20)),
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
                Text('Cristine Rose'),
                Text.rich(TextSpan(
                    text: 'Digital goodies designer ',
                    children: [
                      TextSpan(
                          text: '@pixsellz',
                          style: TextStyle(color: Colors.blue))
                    ])),
                Text('Everything is designed.'),
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
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    images[index].url2,
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

List<image> images = [
  image(
      'https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg'),
  image(
      'https://cdn.britannica.com/08/187508-050-D6FB5173/Shanghai-Tower-Gensler-San-Francisco-world-Oriental-2015.jpg'),
  image('https://cdn.mos.cms.futurecdn.net/wtqqnkYDYi2ifsWZVW2MT4-1200-80.jpg'),
  image(
      'https://images.pexels.com/photos/111755/pexels-photo-111755.jpeg?cs=srgb&dl=pexels-pattama-choomsree-111755.jpg&fm=jpg'),
  image(
      'https://i.pinimg.com/originals/86/3e/ef/863eef974d1011a0d3c7a2698591bb3e.jpg'),
  image('https://www.desicomments.com/dc3/21/445063/445063.png'),
  image(
      'https://parade.com/wp-content/uploads/2019/10/Life-Quotes-Dolly-680x430.jpg'),
  image(
      'https://images2.minutemediacdn.com/image/upload/c_crop,h_726,w_1292,x_199,y_0/f_auto,q_auto,w_1100/v1578352479/shape/mentalfloss/62455-shout-factory1.jpg'),
  image(
      'https://s3.scoopwhoop.com/anj2/5fbb819960c0603f5625e604/222f1044-32a8-4e69-ae15-d1070d954086.jpg'),
  image('https://miro.medium.com/max/1200/0*s7vGN34hz5jJUYTm.png'),
  image(
      'https://jw-webmagazine.com/wp-content/uploads/2020/03/Kimetsu-no-YaibaDemon-Slayer.jpg'),
  image(
      'https://www.denofgeek.com/wp-content/uploads/2019/02/mcu-1-iron-man.jpg?fit=1200%2C675')
];
