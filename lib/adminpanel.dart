import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wbpmorningreport/createuser.dart';
import 'package:wbpmorningreport/viewusers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wbpmorningreport/login_screen.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateUser()),
                  );
                },
                padding: EdgeInsets.only(top: 15, bottom: 15),
                color: Color.fromRGBO(255, 200, 100, 1),
                child: Text("Create new users",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 18,
                        fontFamily: 'Fredoka One')),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewUsers()),
                  );
                },
                padding: EdgeInsets.only(top: 15, bottom: 15),
                color: Color.fromRGBO(255, 100, 0, 1),
                child: Text(
                  "View users",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Fredoka One'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateUser()),
                  );
                },
                padding: EdgeInsets.only(top: 15, bottom: 15),
                color: Color.fromRGBO(155, 200, 150, 1),
                child: Text("View Morning Report",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Fredoka One')),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                padding: EdgeInsets.only(top: 50, bottom: 15),
                //color: Color.fromRGBO(155, 200, 150, 1),
                child: Text("Sign Out",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Fredoka One')),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
