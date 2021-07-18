import 'package:flutter/material.dart';
import 'package:appnew/log_in.dart';
import 'package:appnew/Sign_up.dart';
import 'package:appnew/bottomnav.dart';
import 'package:appnew/DM.dart';
import 'package:appnew/profile.dart';
void main() => runApp(MaterialApp(
  home: homePage(),
));

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png',
                  width: 100,
                  height: 50,
                ),
                SizedBox(height: 100),
                FlatButton(
                    height: 50,
                    minWidth: 300,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Text('Log in'),
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10))),
                SizedBox(height: 30),
                FlatButton(
                    height: 50,
                    minWidth: 300,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => signup()));
                    },
                    child: Text('Sign up'),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.lightBlue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10))),
              ]),
        ),
      ),
    );
  }
}