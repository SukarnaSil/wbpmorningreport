import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wbpmorningreport/battalion.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:wbpmorningreport/adminpanel.dart';
import 'package:firebase_database/firebase_database.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}



class _CreateUserState extends State<CreateUser> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String email, password, sancStr;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.reference();
  ProgressDialog _progressDialog;

  List<Battalion> _dropdownItems = [
    Battalion(0, "Choose your Battalion"),
    Battalion(1, "SAP 1st Battalion"),
    Battalion(2, "SAP 2nd Battalion"),
    Battalion(3, "SAP 3rd Battalion"),
    Battalion(4, "SAP 4th Battalion"),
    Battalion(5, "SAP 6th Battalion"),
    Battalion(6, "SAP 7th Battalion"),
    Battalion(7, "SAP 8th Battalion")
  ];

  List<DropdownMenuItem<Battalion>> _dropdownMenuItems;
  Battalion _selectedBattalion;
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedBattalion = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<Battalion>> buildDropDownMenuItems(List Battalions) {
    List<DropdownMenuItem<Battalion>> items = List();
    for (Battalion battalion in Battalions) {
      items.add(
        DropdownMenuItem(
          child: Text(battalion.name),
          value: battalion,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    _progressDialog = ProgressDialog(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Create User"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            //color: Colors.white,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                border: Border.all()),
            child: DropdownButton<Battalion>(
                value: _selectedBattalion,
                items: _dropdownMenuItems,
                onChanged: (battalion) {
                  setState(() {
                    _selectedBattalion = battalion;
                  });
                }),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 20.0, right: 20, bottom: 10, top: 20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter sanctioned strength",
                  labelText: "Sanctioned Strength",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 3,
                    borderSide: BorderSide(width: 2, color: Colors.orange[900]),
                  )),
              onChanged: (value) {
                sancStr = value;
              },
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter Email Address",
                  labelText: "Email ID",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 3,
                    borderSide: BorderSide(width: 2, color: Colors.orange[900]),
                  )),
              onChanged: (value) {
                email = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter Password",
                  labelText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 3,
                    borderSide: BorderSide(width: 2, color: Colors.orange[900]),
                  )),
              onChanged: (value) {
                password = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: RaisedButton(
              child: Text("Create User"),
              onPressed: () async {
                setState(() {});
                try {
                  showLoaderDialog(context);
                  if (email != null && password != null) {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    final FirebaseUser user = await _auth.currentUser();
                    final uid = user.uid;

                    dbRef.child("Users").child(uid).set({
                      "uid": uid,
                      "batt": _selectedBattalion.name,
                      "email": email,
                      "pass": password,
                      "sancStr": sancStr
                    }).then((_) {
                      Navigator.pop(context);
                      displaySnackBar(context, "User created successfully!");
                    }).catchError((onError) {
                      print(onError);
                    });
                    setState(() {});
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error creating account"),
                            content: Text(
                                "Please enter your email address and password properly"),
                            actions: [
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  }
                } catch (e) {
                  String prblm = e.toString();
                  displaySnackBar(context, prblm);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  displaySnackBar(BuildContext context, String mssg) {
    final snackBar = SnackBar(content: Text(mssg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text("Creating user...\nPlease wait...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
