import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wbpmorningreport/user.dart';

class ViewUsers extends StatefulWidget {
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  List<User> userList = [];

  void initState() {
    super.initState();
    DatabaseReference dbref =
        FirebaseDatabase.instance.reference().child("Users");
    dbref.once().then((DataSnapshot dataSnapsnhot) {
      userList.clear();
      var keys = dataSnapsnhot.value.keys;
      var values = dataSnapsnhot.value;

      for (var key in keys) {
        User user = new User(
          values[key]['batt'],
          values[key]['email'],
          values[key]['pass'],
        );
        userList.add(user);
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Created Users"),
        ),
        body: userList.length == 0
            ? Text("No user available")
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return CardUI(userList[index].batt, userList[index].email,
                      userList[index].pass);
                }));
  }
}

Widget CardUI(String batt, String email, String password) {
  return Card(
    color: Colors.lightBlueAccent,
    margin: EdgeInsets.all(20),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(batt),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(email),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(password),
        ),
      ],
    ),
  );
}

