import 'package:appnew/Main_page.dart';
import 'package:flutter/material.dart';
import 'package:appnew/Sign_up.dart';
import 'package:appnew/home_page.dart';
void main() => runApp(MaterialApp(
  home: login(),
));
class login extends StatelessWidget {
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
              SizedBox(height: 60),
              Container(
                height: 80,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('                                                     Forgot Password?',style:TextStyle(color: Colors.lightBlue),),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 2.0,
                ),
                margin: EdgeInsets.all(10.0),

              ),
              FlatButton(
                height: 50,
                minWidth: 300,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mainpage()));
                },
                child: Text('Log in'),
                color: Colors.lightBlue,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('------------OR------------'),
                ],
              ),
              SizedBox(height:20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                        'Dont have an account?'
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: Text('Sign Up',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),

    );
  }
}