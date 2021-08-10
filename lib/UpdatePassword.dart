import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class changePass extends StatefulWidget {
  const changePass({Key? key}) : super(key: key);

  @override
  _changePassState createState() => _changePassState();
}

class _changePassState extends State<changePass> {
  @override
  Widget build(BuildContext context) {
    var _newPasswordController = TextEditingController();
    var _repeatPasswordController = TextEditingController();
    final auth = FirebaseAuth.instance;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    @override
    void dispose() {
      _newPasswordController.dispose();
      _repeatPasswordController.dispose();
      super.dispose();
    }

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Change Password',
              style: TextStyle(color: Colors.black),
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            decoration:
                            InputDecoration(hintText: "New Password"),
                            controller: _newPasswordController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Password Cannot Be Blank';
                              else if (value.length < 8)
                                return "Password must be atleast 8 characters long";
                              else
                                return null;
                            }),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Repeat Password",
                          ),
                          obscureText: true,
                          controller: _repeatPasswordController,
                          validator: (value) {
                            return _newPasswordController.text == value
                                ? null
                                : "Please validate your entered password";
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      FlatButton(
                          height: 50,
                          minWidth: 200,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await auth.currentUser!
                                  .updatePassword(_newPasswordController.text);
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Update Password',
                              style:
                              TextStyle(color: Colors.white, fontSize: 20)),
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10))),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        height: 50,
                        minWidth: 200,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel',
                            style:
                            TextStyle(color: Colors.black, fontSize: 20)),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.lightBlue,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}