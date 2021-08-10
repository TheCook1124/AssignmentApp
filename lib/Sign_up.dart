import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appnew/log_in.dart';
import 'package:appnew/home_page.dart';
import 'package:appnew/bottomnav.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
      home: signup(),
    ));

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  final TextEditingController _uname = TextEditingController();
  final TextEditingController _pword = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _cpword = TextEditingController();
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
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32.0),
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                              controller: _uname,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                              ),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Username Cannot Be Blank';
                                else
                                  return null;
                              }),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            controller: _pword,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Password Cannot Be Blank';
                              else if (value.length < 8)
                                return "Password must be atleast 8 characters long";
                              else
                                return null;
                            }
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            obscureText: true,
                            controller: _cpword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                            ),
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Confirm Password Cannot Be Blank';
                              else if (value != _pword.text)
                                return 'Not Matching with Password';
                              else if (value.length < 8)
                                return "Password must be atleast 8 characters long";
                              else
                                return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email ID',
                              ),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Email Cannot Be Blank';
                                else
                                  return null;
                              }
                          ),
                        ),
                        SizedBox(height: 40.0),
                        FlatButton(
                          height: 50,
                          minWidth: 300,
                          onPressed: () async {
                            if (fkey.currentState!.validate()) {
                              await Register();
                              await add
                                  .collection("users")
                                  .doc(auth.currentUser!.uid)
                                  .set(
                                {
                                  "Username": _uname.text,
                                  "Email-id": _email.text,
                                },
                              );
                              await Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => NavBottom()));
                            }
                            ;

                          },
                          child: Text('Sign Up'),
                          color: Colors.lightBlue,
                        ),
                      ],

                  ),
                ),

                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('------------OR------------'),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text('Have an Account?'),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
                        },
                        child: Text(
                          'Log in',
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
      ),
    );
  }

  bool? success;
  String? u_email;

  Future<void> Register() async {
    final User? user = (await auth.createUserWithEmailAndPassword(
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
