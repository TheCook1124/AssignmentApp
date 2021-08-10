import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'DispPostSearch.dart';

class profile extends StatefulWidget {
  final String user;

  const profile({Key? key, required this.user}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  final auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _email = TextEditingController();
  String dp = '';
  String uid = '';
  bool following = false;

  Future<void> getDocument() async {
    var documentSnapshot =
    await firestoreInstance.collection('users').doc(widget.user).get();
    var follow = await isFollowing();
    setState(() {
      following = follow;
      uid = documentSnapshot.id;
      _username.text = documentSnapshot.get('username');
      _bio.text = documentSnapshot.get('bio');
      dp = documentSnapshot.get('profilepic');
      _email.text = documentSnapshot.get('email');
    });
  }

  @override
  void initState() {
    super.initState();
    getDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text(
            _username.text,
            style: TextStyle(color: Colors.black),
          )
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
                    backgroundImage: (dp.isNotEmpty) ? NetworkImage(dp) : null,
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
                StreamBuilder<QuerySnapshot>(
                  stream: firestoreInstance
                      .collection('followers')
                      .where('following', isEqualTo: uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int length = snapshot.data!.size;
                      return Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(length.toString(),
                                  style: TextStyle(fontSize: 20)),
                              Text('Followers', style: TextStyle(fontSize: 15))
                            ],
                          ));
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),

                StreamBuilder<QuerySnapshot>(
                  stream: firestoreInstance
                      .collection('followers')
                      .where('follower', isEqualTo: uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int length = snapshot.data!.size;
                      return Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(length.toString(),
                                  style: TextStyle(fontSize: 20)),
                              Text('Following', style: TextStyle(fontSize: 15))
                            ],
                          ));
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              _username.text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Text(
                  'Email ID:  ',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(_email.text, style: TextStyle(color: Colors.black))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 50, 8),
            child: Container(
              child: Text(
                _bio.text,
                maxLines: null,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                      onPressed: () async {
                        if (await isFollowing()) {
                          final querySnapshot = await firestoreInstance
                              .collection('followers')
                              .where('following',
                              isEqualTo: uid)
                              .where('follower', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                              .get();
                          final documentId = querySnapshot.docs[0].id;
                          await firestoreInstance
                              .collection('followers')
                              .doc(documentId)
                              .delete();
                        } else {
                          await firestoreInstance.collection('followers').add({
                            'follower': FirebaseAuth.instance.currentUser!.uid,
                            'following': uid
                          });
                        }
                        setState(() {
                          following = !following;
                        });
                      },
                      child: Text(
                        (following == true) ? 'Unfollow' : 'Follow',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Message',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(height: 0),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: firestoreInstance
                      .collection('post')
                      .where('uid', isEqualTo: widget.user)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return new GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot ds = snapshot.data!.docs[index];
                            return displayPostSearch(documentsnapshot: ds);
                          },
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ));
                    } else {
                      return LinearProgressIndicator();
                    }
                  }))
        ],
      ),
    );
  }

  Future<bool> isFollowing() async {
    final snapshot = await firestoreInstance
        .collection('followers')
        .where('following', isEqualTo: uid)
        .where('follower', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot.size == 1;
  }
}