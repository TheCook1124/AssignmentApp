import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appnew/Profile_page.dart';

class searchProfile extends StatefulWidget {
  const searchProfile({Key? key}) : super(key: key);

  @override
  _searchProfileState createState() => _searchProfileState();
}

class _searchProfileState extends State<searchProfile> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot? snapshotData;
  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData!.docs.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                NetworkImage(snapshotData!.docs[index].get('profilepic')),
              ),
              title: Text(snapshotData!.docs[index].get('username')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          profile(user: snapshotData!.docs[index].id)),
                );
              });
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        title: SizedBox(
            height: 50,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      prefixIcon: Icon(Icons.search),

                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                          borderSide:
                          new BorderSide(color: Color(0xFFCBCBCB)))),
                ))),
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExecuted = true;
                      });
                    });
                  },
                  icon: Icon(Icons.search));
            },
          )
        ],
      ),
      body: isExecuted
          ? searchedData()
          : Container(child: Center(child: Text('Search Friends'))),
    );
  }
}

class DataController extends GetxController {
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
    await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('users')
        .where('username', isGreaterThanOrEqualTo: queryString)
        .get();
  }
}