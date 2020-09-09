import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wbpmorningreport/homescreen.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String email, password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase _database;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text('Login')),
        key: _scaffoldKey,
        body: Center(
            child: Container(
                alignment: Alignment.center,
                child: SafeArea(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/wbp_logo.png'),
                            width: 100,
                            height: 100,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "Welcome to\nArmed Police Morning Report Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'Lobster Two'),
                                textAlign: TextAlign.center,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 40),
                              child: Text(
                                "Sign Up to your battalion account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'Lobster Two'),
                                textAlign: TextAlign.center,
                              )),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10, top: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: "Email ID",
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: "Enter Email ID",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.red),
                                      gapPadding: 3),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.red),
                                      borderRadius: BorderRadius.circular(10.0),
                                      gapPadding: 3)),
                              onChanged: (value) {
                                email = value;
                              },
                              controller: emailInputController,
                            ),
                          ),
                          Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: "Enter password",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.red),
                                        gapPadding: 3),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gapPadding: 3)),
                                onChanged: (value) {
                                  password = value;
                                },
                                controller: pwdInputController,
                              )),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: SizedBox(
                                width: double.infinity,
                                child: FlatButton(
                                    onPressed: () async {
                                      //displaySnackBar(context, "pressed");
                                      setState(() {
                                        //showProgress = true;
                                      });
                                      try {
                                        if (email != null && password != null) {
                                          if (email == "wbpap" &&
                                              password == "WBPAP") {
                                            final newuser = await _auth
                                                .signInWithEmailAndPassword(
                                                    email: email,
                                                    password: password);
                                            final FirebaseUser user =
                                                await _auth.currentUser();
                                            final uid = user.uid;
                                            displaySnackBar(
                                                context, uid.toString());
                                            if (newuser != null) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()),
                                              );
                                              setState(() {
                                                //showProgress = false;
                                              });
                                            }
                                          } else {
                                            final newuser = await _auth
                                                .signInWithEmailAndPassword(
                                                    email: email,
                                                    password: password);
                                            final FirebaseUser user =
                                                await _auth.currentUser();
                                            final uid = user.uid;
                                            displaySnackBar(
                                                context, uid.toString());
                                            if (newuser != null) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()),
                                              );
                                              setState(() {
                                                //showProgress = false;
                                              });
                                            }
                                          }
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      "Error creating account"),
                                                  content: Text(
                                                      "Please enter your email address and password properly"),
                                                  actions: [
                                                    FlatButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
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
                                    child: Text("Login",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    color: Colors.cyan[900],
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0))))),
                          )
                        ],
                      )
                    ],
                  ),
                ))));
  }

  displaySnackBar(BuildContext context, String mssg) {
    final snackBar = SnackBar(content: Text(mssg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
