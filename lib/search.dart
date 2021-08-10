import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appnew/DispPostSearch.dart';
import 'package:appnew/SearchProf.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final firestoreInstance = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final TextEditingController _username = TextEditingController();

  Future<void> getDocument() async {
    var documentSnapshot = await firestoreInstance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
    setState(() {
      _username.text = documentSnapshot.get('username');
    });
  }

  @override
  void initState() {
    super.initState();
    getDocument();
  }

  @override
  Widget build(BuildContext context) {
    //final firestoreInstance = FirebaseFirestore.instance;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            title: SizedBox(
              height: 50,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => searchProfile()),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          Text('Search', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      color: Colors.black12,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)))),
            )),
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
                      SizedBox(width: 5),
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
                child: StreamBuilder<QuerySnapshot>(
                    stream: firestoreInstance
                        .collection('post')
                        .where('username', isNotEqualTo: _username.text)
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
                              crossAxisCount: 2,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                            ));
                      } else {
                        return LinearProgressIndicator();
                      }
                    }))
          ],
        ));
  }
}