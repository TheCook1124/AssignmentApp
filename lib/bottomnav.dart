import 'package:appnew/home_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appnew/main.dart';
import 'package:appnew/Main_page.dart';
import 'package:appnew/search.dart';
import 'package:appnew/profile.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({Key? key}) : super(key: key);

  @override
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Widget? body;

    switch (curIndex) {
      case 0:
        body = Mainpage();
        break;

      case 1:
        body = Search();
        break;

      case 4:
      body= profile();
        break;

      default:
        body = null;
        break;
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curIndex,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.black),

        onTap: (int index) => setState(() => curIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.heartOutline), label: ''),
          BottomNavigationBarItem(
              icon: InkWell(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://uifaces.co/our-content/donated/LpiGpOEC.jpg'),
                  radius: 15,
                ),
              ),
              label: ''),
        ],
      ),
      body: body,
    );
  }
}
