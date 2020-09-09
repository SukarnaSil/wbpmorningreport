import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wbpmorningreport/login_screen.dart';
import 'package:wbpmorningreport/homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
      /*FirebaseAuth.instance.currentUser().then((res) {
        print(res);
        if (res != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      });*/
    });

    /*_mockCheckForSession().then((status) {
      /*if (status) {
        _navigateToHome();
      } else {
        _navigateToLogin();
      }*/
    });*/
  }

  /*Future<bool> _mockCheckForSession() async {
    if (await FirebaseAuth.instance.currentUser() != null) {
      SnackBar(
        content: Text("Loged in"),
      );
    } else {
      SnackBar(content: Text("Not Loged in"));
    }
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/wbp_logo.png'),

            /*Shimmer.fromColors(
              period: Duration(milliseconds: 1500),
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xffe100ff),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Vicon",
                  style: TextStyle(
                    fontSize: 90.0,
                    fontFamily: 'Pacifico',
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 18.0,
                        color: Colors.black87,
                        offset: Offset.fromDirection(120, 12)
                      )
                    ]
                  ),
                ),
              ),
            )*/
          ],
        ),
      ),
    ));
  }
}
