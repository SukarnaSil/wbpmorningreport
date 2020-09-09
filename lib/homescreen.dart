import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wbpmorningreport/adminpanel.dart';
import 'dart:async';
import 'package:wbpmorningreport/battalion.dart';
import 'package:wbpmorningreport/battalionreportviewer.dart';

import 'package:wbpmorningreport/login_screen.dart';
import 'package:wbpmorningreport/makemorningreport.dart';
import 'package:wbpmorningreport/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.reference();
  String retrievedName, result;
  List<User> userList = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var txt = TextEditingController();
  String textHolder = ' ';
  String emailHolder = ' ';
  String strHolder = ' ';
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.currentUser().then((res) {
      if (res != null) {
        if (res.email == "wbpap@gmail.com") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminPanel()),
          );
        } else {
          getBattalionforUser();

          setState(() {});
        }
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  color: Color.fromRGBO(50, 50, 50, 1),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    "Battalion / Unit Name : ",
                                    style: TextStyle(
                                        fontFamily: 'Balsamiq Sans',
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0, top: 5),
                                  child: Text(
                                    '$textHolder',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Balsamiq Sans',
                                        color: Color.fromRGBO(147, 194, 181, 1),
                                        fontSize: 16),
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    "Registered Email ID : ",
                                    style: TextStyle(
                                        fontFamily: 'Balsamiq Sans',
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0, top: 5),
                                  child: Text(
                                    '$emailHolder',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Balsamiq Sans',
                                        color: Color.fromRGBO(147, 194, 181, 1),
                                        fontSize: 16),
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    "Sanctioned Strength : ",
                                    style: TextStyle(
                                        fontFamily: 'Balsamiq Sans',
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0, top: 5),
                                  child: Text(
                                    '$strHolder',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Balsamiq Sans',
                                        color: Color.fromRGBO(147, 194, 181, 1),
                                        fontSize: 16),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MakeMorningReport(textHolder)),
                          );
                        },
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Create Morning Report",
                            style: TextStyle(
                                fontSize: 18, fontFamily: 'Fredoka One'),
                          ),
                        ),
                      ),
                    ),
                  )),
                  Padding(
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BattalionReportViewer(textHolder)),
                          );
                        },
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "View Morning Report",
                            style: TextStyle(
                                fontSize: 18, fontFamily: 'Fredoka One'),
                          ),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: RaisedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text("SIGN OUT"),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  displaySnackBar(BuildContext context, String mssg) {
    final snackBar = SnackBar(content: Text(mssg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  getBattalionforUser() {
    FirebaseAuth.instance.currentUser().then((res) => FirebaseDatabase.instance
            .reference()
            .child("Users")
            .child(res.uid)
            .once()
            .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> values = snapshot.value;

          setState(() {
            textHolder = values["batt"];
            emailHolder = values["email"];
            strHolder = values["sancStr"];
          });
        }));
  }
}
