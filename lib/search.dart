import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appnew/main.dart';
import 'package:appnew/bottomnav.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 15),
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Color(0xFFCBCBCB),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                      borderSide: new BorderSide(color: Color(0xFFCBCBCB)),
                    ),
                  ),
                ),
              )),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //IGTV ,SPORTS
            Container(
                height: 60,
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: [
                  Row(
                    children: [
                      FlatButton(
                          height: 50,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                EvaIcons.tvOutline,
                                size: 21,
                              ),
                              Text('IGTV',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5))),
                      SizedBox(width: 5),
                      FlatButton(
                          height: 50,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                EvaIcons.shoppingBag,
                                size: 21,
                              ),
                              Text('SHOP',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5))),
                      SizedBox(width: 5),

                      FlatButton(
                          height: 50,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.sports_cricket,
                                size: 21,
                              ),
                              Text('SPORTS',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5))),
                      SizedBox(width: 5),
                      FlatButton(
                          height: 50,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                EvaIcons.car,
                                size: 21,
                              ),
                              Text('AUTO',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5))),
                      SizedBox(width:5),
                      FlatButton(
                          height: 50,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.fastfood,
                                size: 21,
                              ),
                              Text('FOOD',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5))),
                    ],
                  ),
                ], scrollDirection: Axis.horizontal)),
            Divider(height: 0),
            //IMAGES
            Expanded(
              child: GridView.builder(
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(images[index].url2, fit: BoxFit.cover,);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  )),
            )
          ],
        ));
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
  image('https://miro.medium.com/max/1200/0*s7vGN34hz5jJUYTm.png')
];
