import 'package:flutter/material.dart';
import 'package:appnew/log_in.dart';
import 'package:appnew/home_page.dart';
import 'package:appnew/bottomnav.dart';
void main() => runApp(MaterialApp(
  home: signup(),
));
class signup extends StatelessWidget {
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
              Container(
                height: 80,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email-id',
                  ),
                ),
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
                      MaterialPageRoute(builder: (context) => NavBottom()));
                },
                child: Text('Sign Up'),
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
                        'Have an Accountt?'
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => login()));
                      },
                      child: Text('Log in',
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
