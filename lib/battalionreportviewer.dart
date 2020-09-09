import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';

class BattalionReportViewer extends StatefulWidget {
  final String _battName;
  BattalionReportViewer(this._battName, {Key key}) : super(key: key);

  _BattalionReportViewerState createState() => _BattalionReportViewerState();
}

class _BattalionReportViewerState extends State<BattalionReportViewer> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String co_ss = '',
      dc_ss = '',
      dysp_ac_ss = '',
      insp_ab_ss = '',
      insp_w_ss = '',
      si_ab_ss = '',
      si_ub_ss = '',
      si_w_ss = '',
      srt_ss = '',
      sro_ss = '',
      asi_ub_ss = '',
      asi_ab_ss = '',
      asi_w_ss = '',
      arm_asi_ss = '',
      arm_const_ss = '',
      nk_ss = '',
      const_w_ss = '',
      const_ss = '',
      hpd_ss = '',
      grp1_pd_ss = '',
      pd_ss = '',
      total_ss = '';

  String co_as = '',
      dc_as = '',
      dysp_ac_as = '',
      insp_ab_as = '',
      insp_w_as = '',
      si_ab_as = '',
      si_ub_as = '',
      si_w_as = '',
      srt_as = '',
      sro_as = '',
      asi_ub_as = '',
      asi_ab_as = '',
      asi_w_as = '',
      arm_asi_as = '',
      arm_const_as = '',
      nk_as = '',
      const_w_as = '',
      const_as = '',
      hpd_as = '',
      grp1_pd_as = '',
      pd_as = '',
      total_as = '';

  String co_vac = '',
      dc_vac = '',
      dysp_ac_vac = '',
      insp_ab_vac = '',
      insp_w_vac = '',
      si_ab_vac = '',
      si_ub_vac = '',
      si_w_vac = '',
      srt_vac = '',
      sro_vac = '',
      asi_ub_vac = '',
      asi_ab_vac = '',
      asi_w_vac = '',
      arm_asi_vac = '',
      arm_const_vac = '',
      nk_vac = '',
      const_w_vac = '',
      const_vac = '',
      hpd_vac = '',
      grp1_pd_vac = '',
      pd_vac = '',
      total_vac = '';

  String co_dpd = '',
      dc_dpd = '',
      dysp_ac_dpd = '',
      insp_ab_dpd = '',
      insp_w_dpd = '',
      si_ab_dpd = '',
      si_ub_dpd = '',
      si_w_dpd = '',
      srt_dpd = '',
      sro_dpd = '',
      asi_ub_dpd = '',
      asi_ab_dpd = '',
      asi_w_dpd = '',
      arm_asi_dpd = '',
      arm_const_dpd = '',
      nk_dpd = '',
      const_w_dpd = '',
      const_dpd = '',
      hpd_dpd = '',
      grp1_pd_dpd = '',
      pd_dpd = '',
      total_dpd = '';

  String co_dcooff = '',
      dc_dcooff = '',
      dysp_ac_dcooff = '',
      insp_ab_dcooff = '',
      insp_w_dcooff = '',
      si_ab_dcooff = '',
      si_ub_dcooff = '',
      si_w_dcooff = '',
      srt_dcooff = '',
      sro_dcooff = '',
      asi_ub_dcooff = '',
      asi_ab_dcooff = '',
      asi_w_dcooff = '',
      arm_asi_dcooff = '',
      arm_const_dcooff = '',
      nk_dcooff = '',
      const_w_dcooff = '',
      const_dcooff = '',
      hpd_dcooff = '',
      grp1_pd_dcooff = '',
      pd_dcooff = '',
      total_dcooff = '';

  String co_dco = '',
      dc_dco = '',
      dysp_ac_dco = '',
      insp_ab_dco = '',
      insp_w_dco = '',
      si_ab_dco = '',
      si_ub_dco = '',
      si_w_dco = '',
      srt_dco = '',
      sro_dco = '',
      asi_ub_dco = '',
      asi_ab_dco = '',
      asi_w_dco = '',
      arm_asi_dco = '',
      arm_const_dco = '',
      nk_dco = '',
      const_w_dco = '',
      const_dco = '',
      hpd_dco = '',
      grp1_pd_dco = '',
      pd_dco = '',
      total_dco = '';

  String co_cas = '',
      dc_cas = '',
      dysp_ac_cas = '',
      insp_ab_cas = '',
      insp_w_cas = '',
      si_ab_cas = '',
      si_ub_cas = '',
      si_w_cas = '',
      srt_cas = '',
      sro_cas = '',
      asi_ub_cas = '',
      asi_ab_cas = '',
      asi_w_cas = '',
      arm_asi_cas = '',
      arm_const_cas = '',
      nk_cas = '',
      const_w_cas = '',
      const_cas = '',
      hpd_cas = '',
      grp1_pd_cas = '',
      pd_cas = '',
      total_cas = '';

  String co_trng = '',
      dc_trng = '',
      dysp_ac_trng = '',
      insp_ab_trng = '',
      insp_w_trng = '',
      si_ab_trng = '',
      si_ub_trng = '',
      si_w_trng = '',
      srt_trng = '',
      sro_trng = '',
      asi_ub_trng = '',
      asi_ab_trng = '',
      asi_w_trng = '',
      arm_asi_trng = '',
      arm_const_trng = '',
      nk_trng = '',
      const_w_trng = '',
      const_trng = '',
      hpd_trng = '',
      grp1_pd_trng = '',
      pd_trng = '',
      total_trng = '';

  String co_avbnhq = '',
      dc_avbnhq = '',
      dysp_ac_avbnhq = '',
      insp_ab_avbnhq = '',
      insp_w_avbnhq = '',
      si_ab_avbnhq = '',
      si_ub_avbnhq = '',
      si_w_avbnhq = '',
      srt_avbnhq = '',
      sro_avbnhq = '',
      asi_ub_avbnhq = '',
      asi_ab_avbnhq = '',
      asi_w_avbnhq = '',
      arm_asi_avbnhq = '',
      arm_const_avbnhq = '',
      nk_avbnhq = '',
      const_w_avbnhq = '',
      const_avbnhq = '',
      hpd_avbnhq = '',
      grp1_pd_avbnhq = '',
      pd_avbnhq = '',
      total_avbnhq = '';

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  final pdf = pw.Document();
  writeOnPDF() {
    pdf.addPage(pw.MultiPage(
        orientation: pw.PageOrientation.landscape,
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(20),
        maxPages: 1,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(level: 0, child: pw.Text("Morning Report")),
            pw.Row(children: <pw.Widget>[
              pw.Column(children: <pw.Widget>[
                pw.Text("Strength Type",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("Sanctioned Strength",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("Sanctioned Strength",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("Sanctioned Strength",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("Sanctioned Strength",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("Sanctioned Strength",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("Sanctioned Strength",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("Sanctioned Strength",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("Sanctioned Strength",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ]),
              pw.Column(children: <pw.Widget>[
                pw.Container(
                    width: 100,
                    child: pw.Text("CO",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("1",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("0",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("1",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("0",
                        textAlign: pw.TextAlign.center, style: pw.TextStyle())),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "0",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "0",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "2",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text("0",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
              ]),
              pw.Column(children: <pw.Widget>[
                pw.Container(
                    width: 100,
                    child: pw.Text("CO",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("1",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("0",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("1",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("0",
                        textAlign: pw.TextAlign.center, style: pw.TextStyle())),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "0",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "0",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "2",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text("0",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
              ]),
              pw.Column(children: <pw.Widget>[
                pw.Container(
                    width: 100,
                    child: pw.Text("CO",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("1",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    alignment: pw.Alignment.center,
                    width: 100,
                    child: pw.Text("0",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text("1",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "0",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "0",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "0",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text(
                      "2",
                      textAlign: pw.TextAlign.center,
                    )),
                pw.Container(
                    width: 100,
                    child: pw.Text("0",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
              ]),
            ])
          ];
        }));
  }

  Future savePdf() async {
    Directory docDir = await getExternalStorageDirectory();
    String docPath = docDir.path;
    File file = File("$docPath/example.pdf");
    file.writeAsBytes(pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Morning Report Viewer ${widget._battName}"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
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
                    displaySnackBar(context, formattedDate);
                    getdata(formattedDate);
                  });
                },
                child: Icon(
                  Icons.date_range,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  writeOnPDF();
                  savePdf();
                  displaySnackBar(context, "PDF geenrated");
                },
                child: Icon(
                  Icons.print,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    //alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Strength",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Sanction Strength",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Actual Strength",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Vacancy",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Dep by PD",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Dep by Co. Off.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Dep by CO",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Casualty",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Training",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                    child: Text(
                      "Avl. at Bn HQ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              width: 100,
                              child: Text(
                                "CO",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              width: 100,
                              child: Text(
                                "DC",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(
                                "AC / Dy. Sp",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(
                                "Insp (AB)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(
                                "Insp (W)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(
                                "SI (AB)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(
                                "SI (UB)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(
                                "SI (W)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(
                                "SRT",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              child: Text(
                                "SRO",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "ASI (UB)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "ASI (AB)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "ASI (W)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "Arm ASI",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "Arm Const",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "NK",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "Const (W)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "Const",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "HPD",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "Gr.I PD",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "PD",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "TOTAL",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$co_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$dc_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$dysp_ac_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$insp_ab_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  "$insp_w_ss",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  "$si_ab_ss",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  "$si_ub_ss",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$si_w_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$srt_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                width: 100,
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                child: Text(
                                  '$sro_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$asi_ub_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$asi_ab_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$asi_w_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$arm_asi_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$arm_const_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$nk_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$const_w_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$const_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$hpd_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$grp1_pd_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$pd_ss',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text('$total_ss',
                                    textAlign: TextAlign.center),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$co_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dc_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dysp_ac_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_ab_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_w_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ab_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ub_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_w_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$srt_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              width: 100,
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              child: Text(
                                '$sro_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ub_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ab_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_w_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_asi_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_const_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$nk_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_w_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$hpd_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$grp1_pd_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$pd_as',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text('$total_as',
                                  textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$co_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dc_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dysp_ac_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_ab_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_w_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ab_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ub_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_w_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$srt_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              width: 100,
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              child: Text(
                                '$sro_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ub_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ab_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_w_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_asi_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_const_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$nk_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_w_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$hpd_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$grp1_pd_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$pd_vac',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text('$total_vac',
                                  textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$co_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dc_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dysp_ac_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_ab_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_w_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ab_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ub_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_w_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$srt_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              width: 100,
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              child: Text(
                                '$sro_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ub_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ab_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_w_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_asi_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_const_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$nk_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_w_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$hpd_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$grp1_pd_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$pd_dpd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text('$total_dpd',
                                  textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$co_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dc_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dysp_ac_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_ab_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_w_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ab_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ub_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                "$si_w_dcooff",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$srt_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              width: 100,
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              child: Text(
                                '$sro_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ub_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ab_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_w_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_asi_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_const_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$nk_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_w_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$hpd_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$grp1_pd_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$pd_dcooff',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text('$total_dcooff',
                                  textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$co_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dc_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dysp_ac_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_ab_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_w_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ab_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ub_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_w_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$srt_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              width: 100,
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              child: Text(
                                '$sro_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ub_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ab_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_w_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_asi_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_const_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$nk_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_w_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$hpd_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$grp1_pd_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$pd_dco',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text('$total_dco',
                                  textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$co_cas',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dc_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dysp_ac_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_ab_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_w_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ab_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ub_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_w_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$srt_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              width: 100,
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              child: Text(
                                '$sro_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ub_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ab_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_w_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_asi_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_const_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$nk_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_w_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$hpd_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$grp1_pd_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$pd_cas',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text('$total_cas',
                                  textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$co_trng',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dc_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$dysp_ac_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_ab_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$insp_w_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ab_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_ub_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$si_w_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$srt_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              width: 100,
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              child: Text(
                                '$sro_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ub_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_ub_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$asi_w_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_asi_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$arm_const_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$nk_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_w_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$const_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$hpd_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$grp1_pd_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text(
                                '$pd_trng',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                              width: 100,
                              child: Text('$total_trng',
                                  textAlign: TextAlign.center),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$co_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$dc_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$dysp_ac_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$insp_ab_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$insp_w_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$si_ab_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$si_ub_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$si_w_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$srt_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                width: 100,
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                child: Text(
                                  '$sro_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$asi_ub_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$asi_ab_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$asi_w_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$arm_asi_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$arm_const_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$nk_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$const_w_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$const_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$hpd_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$grp1_pd_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text(
                                  '$pd_avbnhq',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                width: 100,
                                child: Text('$total_avbnhq',
                                    textAlign: TextAlign.center),
                              )
                            ],
                          ),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  getdata(String string) {
    String battalion = widget._battName;

    FirebaseAuth.instance.currentUser().then((res) => FirebaseDatabase.instance
            .reference()
            .child("Sanctioned Strength")
            .child(battalion)
            .once()
            .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> ssStr = snapshot.value;

          setState(() {
            co_ss = ssStr["co"];
            dc_ss = ssStr["dc"];
            dysp_ac_ss = ssStr["ac"];
            insp_ab_ss = ssStr["insp_ab"];
            insp_w_ss = ssStr["insp_w"];
            si_ab_ss = ssStr["si_ab"];
            si_ub_ss = ssStr["si_ub"];
            si_w_ss = ssStr["si_w"];
            srt_ss = ssStr["srt"];
            sro_ss = ssStr["sro"];
            asi_ub_ss = ssStr["asi_ub"];
            asi_ab_ss = ssStr["asi_ab"];
            asi_w_ss = ssStr["asi_w"];
            arm_asi_ss = ssStr["arm_asi"];
            arm_const_ss = ssStr["arm_const"];
            nk_ss = ssStr["nk"];
            const_w_ss = ssStr["const_w"];
            const_ss = ssStr["const"];
            hpd_ss = ssStr["hpd"];
            grp1_pd_ss = ssStr["gpd"];
            pd_ss = ssStr["pd"];
            total_ss = ssStr["totalStr"];
          });
        }));

    FirebaseAuth.instance.currentUser().then((res) => FirebaseDatabase.instance
            .reference()
            .child("Morning Report")
            .child(string)
            .child("Actual Strength")
            .child(battalion)
            .once()
            .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> acStr = snapshot.value;

          setState(() {
            co_as = acStr["co"];
            dc_as = acStr["dc"];
            dysp_ac_as = acStr["ac"];
            insp_ab_as = acStr["insp_ab"];
            insp_w_as = acStr["insp_w"];
            si_ab_as = acStr["si_ab"];
            si_ub_as = acStr["si_ub"];
            si_w_as = acStr["si_w"];
            srt_as = acStr["srt"];
            sro_as = acStr["sro"];
            asi_ub_as = acStr["asi_ub"];
            asi_ab_as = acStr["asi_ab"];
            asi_w_as = acStr["asi_w"];
            arm_asi_as = acStr["arm_asi"];
            arm_const_as = acStr["arm_const"];
            nk_as = acStr["nk"];
            const_w_as = acStr["const_w"];
            const_as = acStr["const"];
            hpd_as = acStr["hpd"];
            grp1_pd_as = acStr["gpd"];
            pd_as = acStr["pd"];
            total_as = acStr["totalStr"];
          });
        }));

    FirebaseAuth.instance.currentUser().then((res) => FirebaseDatabase.instance
            .reference()
            .child("Morning Report")
            .child(string)
            .child("Deployment via PD")
            .child(battalion)
            .once()
            .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> dpd = snapshot.value;

          setState(() {
            co_dpd = dpd["co"];
            dc_dpd = dpd["dc"];
            dysp_ac_dpd = dpd["ac"];
            insp_ab_dpd = dpd["insp_ab"];
            insp_w_dpd = dpd["insp_w"];
            si_ab_dpd = dpd["si_ab"];
            si_ub_dpd = dpd["si_ub"];
            si_w_dpd = dpd["si_w"];
            srt_dpd = dpd["srt"];
            sro_dpd = dpd["sro"];
            asi_ub_dpd = dpd["asi_ub"];
            asi_ab_dpd = dpd["asi_ab"];
            asi_w_dpd = dpd["asi_w"];
            arm_asi_dpd = dpd["arm_asi"];
            arm_const_dpd = dpd["arm_const"];
            nk_dpd = dpd["nk"];
            const_w_dpd = dpd["const_w"];
            const_dpd = dpd["const"];
            hpd_dpd = dpd["hpd"];
            grp1_pd_dpd = dpd["gpd"];
            pd_dpd = dpd["pd"];
            total_dpd = dpd["totalStr"];
          });
        }));

    FirebaseAuth.instance.currentUser().then((res) => FirebaseDatabase.instance
            .reference()
            .child("Morning Report")
            .child(string)
            .child("Deployment via Controlling Officer")
            .child(battalion)
            .once()
            .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> dpCoOff = snapshot.value;

          setState(() {
            co_dcooff = dpCoOff["co"];
            dc_dcooff = dpCoOff["dc"];
            dysp_ac_dcooff = dpCoOff["ac"];
            insp_ab_dcooff = dpCoOff["insp_ab"];
            insp_w_dcooff = dpCoOff["insp_w"];
            si_ab_dcooff = dpCoOff["si_ab"];
            si_ub_dcooff = dpCoOff["si_ub"];
            si_w_dcooff = dpCoOff["si_w"];
            srt_dcooff = dpCoOff["srt"];
            sro_dcooff = dpCoOff["sro"];
            asi_ub_dcooff = dpCoOff["asi_ub"];
            asi_ab_dcooff = dpCoOff["asi_ab"];
            asi_w_dcooff = dpCoOff["asi_w"];
            arm_asi_dcooff = dpCoOff["arm_asi"];
            arm_const_dcooff = dpCoOff["arm_const"];
            nk_dcooff = dpCoOff["nk"];
            const_w_dcooff = dpCoOff["const_w"];
            const_dcooff = dpCoOff["const"];
            hpd_dcooff = dpCoOff["hpd"];
            grp1_pd_dcooff = dpCoOff["gpd"];
            pd_dcooff = dpCoOff["pd"];
            total_dcooff = dpCoOff["totalStr"];
          });
        }));

    FirebaseAuth.instance.currentUser().then((res) => FirebaseDatabase.instance
            .reference()
            .child("Morning Report")
            .child(string)
            .child("Deployment via Commandant")
            .child(battalion)
            .once()
            .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> dpCo = snapshot.value;

          setState(() {
            co_dco = dpCo["co"];
            dc_dco = dpCo["dc"];
            dysp_ac_dco = dpCo["ac"];
            insp_ab_dco = dpCo["insp_ab"];
            insp_w_dco = dpCo["insp_w"];
            si_ab_dco = dpCo["si_ab"];
            si_ub_dco = dpCo["si_ub"];
            si_w_dco = dpCo["si_w"];
            srt_dco = dpCo["srt"];
            sro_dco = dpCo["sro"];
            asi_ub_dco = dpCo["asi_ub"];
            asi_ab_dco = dpCo["asi_ab"];
            asi_w_dco = dpCo["asi_w"];
            arm_asi_dco = dpCo["arm_asi"];
            arm_const_dco = dpCo["arm_const"];
            nk_dco = dpCo["nk"];
            const_w_dco = dpCo["const_w"];
            const_dco = dpCo["const"];
            hpd_dco = dpCo["hpd"];
            grp1_pd_dco = dpCo["gpd"];
            pd_dco = dpCo["pd"];
            total_dco = dpCo["totalStr"];
          });
        }));

    FirebaseAuth.instance.currentUser().then((res) => FirebaseDatabase.instance
            .reference()
            .child("Morning Report")
            .child(string)
            .child("Casualty")
            .child(battalion)
            .once()
            .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> cas = snapshot.value;

          setState(() {
            co_cas = cas["co"];
            dc_cas = cas["dc"];
            dysp_ac_cas = cas["ac"];
            insp_ab_cas = cas["insp_ab"];
            insp_w_cas = cas["insp_w"];
            si_ab_cas = cas["si_ab"];
            si_ub_cas = cas["si_ub"];
            si_w_cas = cas["si_w"];
            srt_cas = cas["srt"];
            sro_cas = cas["sro"];
            asi_ub_cas = cas["asi_ub"];
            asi_ab_cas = cas["asi_ab"];
            asi_w_cas = cas["asi_w"];
            arm_asi_cas = cas["arm_asi"];
            arm_const_cas = cas["arm_const"];
            nk_cas = cas["nk"];
            const_w_cas = cas["const_w"];
            const_cas = cas["const"];
            hpd_cas = cas["hpd"];
            grp1_pd_cas = cas["gpd"];
            pd_cas = cas["pd"];
            total_cas = cas["totalStr"];
          });
        }));

    FirebaseAuth.instance.currentUser().then((res) => FirebaseDatabase.instance
            .reference()
            .child("Morning Report")
            .child(string)
            .child("Training")
            .child(battalion)
            .once()
            .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> trng = snapshot.value;

          setState(() {
            co_trng = trng["co"];
            dc_trng = trng["dc"];
            dysp_ac_trng = trng["ac"];
            insp_ab_trng = trng["insp_ab"];
            insp_w_trng = trng["insp_w"];
            si_ab_trng = trng["si_ab"];
            si_ub_trng = trng["si_ub"];
            si_w_trng = trng["si_w"];
            srt_trng = trng["srt"];
            sro_trng = trng["sro"];
            asi_ub_trng = trng["asi_ub"];
            asi_ab_trng = trng["asi_ab"];
            asi_w_trng = trng["asi_w"];
            arm_asi_trng = trng["arm_asi"];
            arm_const_trng = trng["arm_const"];
            nk_trng = trng["nk"];
            const_w_trng = trng["const_w"];
            const_trng = trng["const"];
            hpd_trng = trng["hpd"];
            grp1_pd_trng = trng["gpd"];
            pd_trng = trng["pd"];
            total_trng = trng["totalStr"];
          });
        }));

    setState(() {
      co_vac = (int.parse(co_ss) - int.parse(co_as)).toString();
      dc_vac = (int.parse(dc_ss) - int.parse(dc_as)).toString();
      dysp_ac_vac = (int.parse(dysp_ac_ss) - int.parse(dysp_ac_as)).toString();
      insp_ab_vac = (int.parse(si_ab_ss) - int.parse(insp_ab_as)).toString();
      insp_w_vac = (int.parse(insp_w_ss) - int.parse(insp_w_as)).toString();
      si_ab_vac = (int.parse(si_ab_ss) - int.parse(si_ab_as)).toString();

      si_ub_vac = (int.parse(si_ub_ss) - int.parse(si_ub_as)).toString();
      si_w_vac = (int.parse(si_w_ss) - int.parse(si_w_as)).toString();
      srt_vac = (int.parse(srt_ss) - int.parse(srt_as)).toString();
      sro_vac = (int.parse(sro_ss) - int.parse(sro_as)).toString();
      asi_ub_vac = (int.parse(asi_ub_ss) - int.parse(asi_ub_as)).toString();
      asi_ab_vac = (int.parse(asi_ab_ss) - int.parse(asi_ab_as)).toString();
      asi_w_vac = (int.parse(asi_w_ss) - int.parse(asi_w_as)).toString();

      arm_asi_vac = (int.parse(arm_asi_ss) - int.parse(arm_asi_as)).toString();
      arm_const_vac =
          (int.parse(arm_const_ss) - int.parse(arm_const_as)).toString();
      nk_vac = (int.parse(nk_ss) - int.parse(nk_as)).toString();
      const_w_vac = (int.parse(const_w_ss) - int.parse(const_w_as)).toString();
      const_vac = (int.parse(const_ss) - int.parse(const_as)).toString();
      hpd_vac = (int.parse(hpd_ss) - int.parse(hpd_as)).toString();
      grp1_pd_vac = (int.parse(grp1_pd_ss) - int.parse(grp1_pd_as)).toString();
      pd_vac = (int.parse(pd_ss) - int.parse(pd_as)).toString();
      total_vac = (int.parse(total_ss) - int.parse(total_as)).toString();







      co_avbnhq = (int.parse(co_as) - int.parse(co_dpd) - int.parse(co_dcooff) - int.parse(co_dco) - int.parse(co_trng) - int.parse(co_cas)).toString();
      /*dc_vac = (int.parse(dc_ss) - int.parse(dc_as)).toString();
      dysp_ac_vac = (int.parse(dysp_ac_ss) - int.parse(dysp_ac_as)).toString();
      insp_ab_vac = (int.parse(si_ab_ss) - int.parse(insp_ab_as)).toString();
      insp_w_vac = (int.parse(insp_w_ss) - int.parse(insp_w_as)).toString();
      si_ab_vac = (int.parse(si_ab_ss) - int.parse(si_ab_as)).toString();

      si_ub_vac = (int.parse(si_ub_ss) - int.parse(si_ub_as)).toString();
      si_w_vac = (int.parse(si_w_ss) - int.parse(si_w_as)).toString();
      srt_vac = (int.parse(srt_ss) - int.parse(srt_as)).toString();
      sro_vac = (int.parse(sro_ss) - int.parse(sro_as)).toString();
      asi_ub_vac = (int.parse(asi_ub_ss) - int.parse(asi_ub_as)).toString();
      asi_ab_vac = (int.parse(asi_ab_ss) - int.parse(asi_ab_as)).toString();
      asi_w_vac = (int.parse(asi_w_ss) - int.parse(asi_w_as)).toString();

      arm_asi_vac = (int.parse(arm_asi_ss) - int.parse(arm_asi_as)).toString();
      arm_const_vac =
          (int.parse(arm_const_ss) - int.parse(arm_const_as)).toString();
      nk_vac = (int.parse(nk_ss) - int.parse(nk_as)).toString();
      const_w_vac = (int.parse(const_w_ss) - int.parse(const_w_as)).toString();
      const_vac = (int.parse(const_ss) - int.parse(const_as)).toString();
      hpd_vac = (int.parse(hpd_ss) - int.parse(hpd_as)).toString();
      grp1_pd_vac = (int.parse(grp1_pd_ss) - int.parse(grp1_pd_as)).toString();
      pd_vac = (int.parse(pd_ss) - int.parse(pd_as)).toString();
      total_vac = (int.parse(total_ss) - int.parse(total_as)).toString();*/
    });
  }

  displaySnackBar(BuildContext context, String mssg) {
    final snackBar = SnackBar(content: Text(mssg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
