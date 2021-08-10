import 'package:appnew/Main_page.dart';
import 'package:flutter/material.dart';
import 'package:appnew/Sign_up.dart';
import 'package:appnew/home_page.dart';
import 'package:appnew/bottomnav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(MaterialApp(
  home: login(),
));

class login extends StatefulWidget {
  @override
  loginState createState() => loginState();
}
class loginState extends  State<login>{
  @override
final TextEditingController _pword = TextEditingController();
final TextEditingController _email = TextEditingController();
final GlobalKey<FormState> fkey = GlobalKey<FormState>();
final auth = FirebaseAuth.instance;

final add = FirebaseFirestore.instance;

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
              Form(
                key: fkey,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(hintText: 'email-id'),
                        validator: (value) {
                          if (value!.isEmpty) return "Please fill this field";
                        },
                      ),
                      TextFormField(
                        controller: _pword,
                        decoration: InputDecoration(hintText: 'Password'),
                        validator: (value) {
                          if (value!.isEmpty)
                            return "Please fill this field";
                          else if (value.length < 8)
                            return "Password is too short";
                        },
                      ),
                      FlatButton(
                        height: 30,
                        minWidth: 300,
                        onPressed: () async {
                          if (fkey.currentState!.validate()) {
                            await Register();
                            await Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => NavBottom()));
                          };

                        },
                        child: Text('log in'),
                        color: Colors.lightBlue,
                      ),
                    ],
                  ),
                ),
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => signup()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.lightBlue),
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

  bool? success;
  String? u_email;

  Future<void> Register() async {
    final User? user = (await auth.signInWithEmailAndPassword(
        email: _email.text, password: _pword.text))
        .user;
    if (user != null) {
      setState(() {
        success = true;
        u_email = user.email;
      });
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _pword.dispose();
    super.dispose();
  }
}