import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class MakeMorningReport extends StatefulWidget {
  final String _strengthName;
  MakeMorningReport(this._strengthName, {Key key}) : super(key: key);

  _MakeMorningReportState createState() => _MakeMorningReportState();
}

class Strength {
  int value;
  String name;

  Strength(this.value, this.name);
}

class _MakeMorningReportState extends State<MakeMorningReport> {
  final dbRef = FirebaseDatabase.instance.reference();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String dateStr = "Choose date of report";

  var co = TextEditingController();
  var dc = TextEditingController();
  var ac = TextEditingController();
  var insp_ab = TextEditingController();
  var insp_w = TextEditingController();
  var si_ab = TextEditingController();
  var si_ub = TextEditingController();
  var si_w = TextEditingController();
  var srt = TextEditingController();
  var sro = TextEditingController();
  var asi_ub = TextEditingController();
  var asi_ab = TextEditingController();

  var asi_w = TextEditingController();
  var arm_asi = TextEditingController();

  var nk = TextEditingController();
  var arm_cons = TextEditingController();
  var cons_w = TextEditingController();
  var cons = TextEditingController();
  var hpd = TextEditingController();
  var grpd = TextEditingController();
  var pd = TextEditingController();

  var battCon = TextEditingController();

  String strengthRes = '';
  String _selectedDate;

  List<Strength> _dropdownItems = [
    Strength(0, "Choose type of Strength"),
    Strength(1, "Actual Strength"),
    Strength(2, "Deployment via PD"),
    Strength(3, "Deployment via Controlling Officer"),
    Strength(4, "Deployment via Commandant"),
    Strength(5, "Casualty"),
    Strength(6, "Training"),
    Strength(7, "Sanctioned Strength"),
  ];

  List<DropdownMenuItem<Strength>> _dropdownMenuItems;
  Strength _selectedStrength;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedStrength = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<Strength>> buildDropDownMenuItems(List Strengths) {
    List<DropdownMenuItem<Strength>> items = List();
    for (Strength strength in Strengths) {
      items.add(
        DropdownMenuItem(
          child: Text(strength.name),
          value: strength,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Create Morning Report"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Morning Report for ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontFamily: 'Balsamiq Sans'),
                  ),
                  Text(
                    "${widget._strengthName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontFamily: 'Balsamiq Sans'),
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$dateStr',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontFamily: 'Balsamiq Sans')),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100))
                            .then((date) {
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(date);
                          setState(() {
                            dateStr = "Report for " + formattedDate;
                            _selectedDate = formattedDate;
                          });
                          displaySnackBar(context, formattedDate);
                        });
                      },
                      child: Icon(
                        Icons.date_range,
                        size: 26.0,
                      ),
                    ),
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: DropdownButton<Strength>(
                value: _selectedStrength,
                items: _dropdownMenuItems,
                onChanged: (strength) {
                  setState(() {
                    _selectedStrength = strength;
                  });
                }),
          ),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Row(
              children: <Widget>[
                Text(
                  "Commandant :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: co,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Deputy Commandant :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: dc,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "DY. SP / Asst. Commandant :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: ac,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Inspector (AB) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: insp_ab,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Inspector (W) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: insp_w,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sub Inspector (AB) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: si_ab,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sub Inspector (UB) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: si_ub,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sub Inspector (W) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: si_w,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "SRT :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: srt,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "SRO :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: sro,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Asst. Sub Insp. (UB) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: asi_ub,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Asst. Sub Insp. (AB) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: asi_ab,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Asst. Sub Insp. (W) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: asi_w,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Arm Asst. Sub Insp. :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: arm_asi,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Arm. Constable :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: arm_cons,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "NK :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: nk,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Constable (W) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: cons_w,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Constable :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: cons,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Head Police Driver :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: hpd,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gr. I Police Driver :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: grpd,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "1000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Police Driver",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: pd,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: "000",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.green),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                        ),
                      )),
                )
              ],
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                  int sumStr = int.parse(co.text) +
                      int.parse(dc.text) +
                      int.parse(ac.text) +
                      int.parse(insp_ab.text) +
                      int.parse(insp_w.text) +
                      int.parse(si_ab.text) +
                      int.parse(si_ub.text) +
                      int.parse(si_w.text) +
                      int.parse(srt.text) +
                      int.parse(sro.text) +
                      int.parse(asi_ub.text) +
                      int.parse(asi_ab.text) +
                      int.parse(asi_w.text) +
                      int.parse(arm_asi.text) +
                      int.parse(arm_cons.text) +
                      int.parse(nk.text) +
                      int.parse(cons_w.text) +
                      int.parse(cons.text) +
                      int.parse(hpd.text) +
                      int.parse(grpd.text) +
                      int.parse(pd.text);

                  setState(() {
                    strengthRes = sumStr.toString();
                  });
                },
                child: Text(
                  "Calculate Total Strength",
                  style: TextStyle(fontFamily: 'Balsamiq Sans', fontSize: 17),
                ),
                color: Colors.brown,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: 30, top: 5),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Total " + _selectedStrength.name + " :  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        '$strengthRes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )),
              ],
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                  var now = new DateTime.now();
                  var formatter = new DateFormat('dd-MM-yyyy');
                  String formattedDate = formatter.format(now);
                  String battName = widget._strengthName;
                  dbRef
                      .child("Morning Report")
                      .child(_selectedDate)
                      .child(_selectedStrength.name)
                      .child(battName)
                      .set({
                    "co": co.text,
                    "dc": dc.text,
                    "ac": ac.text,
                    "insp_ab": insp_ab.text,
                    "insp_w": insp_w.text,
                    "si_ab": si_ab.text,
                    "si_ub": si_ub.text,
                    "si_w": si_w.text,
                    "srt": srt.text,
                    "sro": sro.text,
                    "asi_ab": asi_ab.text,
                    "asi_ub": asi_ub.text,
                    "asi_w": asi_w.text,
                    "arm_asi": arm_asi.text,
                    "arm_const": arm_cons.text,
                    "nk": nk.text,
                    "const_w": cons_w.text,
                    "const": cons.text,
                    "hpd": hpd.text,
                    "gpd": grpd.text,
                    "pd": pd.text,
                    "totalStr": strengthRes
                  }).then((_) {
                    Navigator.pop(context);
                    //displaySnackBar(context, "User created successfully!");
                  }).catchError((onError) {
                    print(onError);
                  });
                },
                child: Text(
                  "Update Total Strength",
                  style: TextStyle(fontFamily: 'Balsamiq Sans', fontSize: 17),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  displaySnackBar(BuildContext context, String mssg) {
    final snackBar = SnackBar(content: Text(mssg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
