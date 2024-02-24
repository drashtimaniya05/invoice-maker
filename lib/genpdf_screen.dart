import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
  }

  Future<pw.Document> createPdf() async {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 20, left: 5, right: 10),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        " INVOICE",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                  //  pw.SizedBox(width: 200),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      pw.Text(
                        "INVOICE#",
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        "CREATION DATE",
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        "DUE DATE",
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 10),
                    ],
                  ),
                  //for user data date,number
                  pw.Column(children: [])
                ],
              ),
            ),
            pw.SizedBox(height: 30),
            pw.Divider(color: PdfColors.grey, indent: 13, endIndent: 13),
            pw.Row(children: [
              pw.SizedBox(width: 20),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "FROM",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold),
                    ),
                  ]),
              pw.SizedBox(width: 200),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "BILL TO",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold),
                    ),
                  ])
            ]),
            pw.SizedBox(height: 30),
            pw.Container(
              margin: pw.EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: pw.EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              width: 450,
              decoration: pw.BoxDecoration(color: PdfColors.grey400),
              child: pw.Row(children: [
                pw.Expanded(
                  child: pw.Text(
                    "DESCRIPTION",
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Expanded(
                  child: pw.Text(
                    "QTY",
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Expanded(
                  child: pw.Text(
                    "PRICE",
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Expanded(
                  child: pw.Text(
                    "AMOUNT",
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold),
                  ),
                ),
              ]),
            ),
            pw.SizedBox(
                height: 5,
                child: pw.ListView.separated(
                    itemBuilder: (context, index) {
                      return pw.Container(
                          child: pw.Row(children: [
                        pw.Text("chocolate"),
                        pw.Text("100"),
                        pw.Text("2"),
                        pw.Text("200"),
                      ]));
                    },
                    separatorBuilder: (context, index) {
                      return pw.Divider(
                        color: PdfColors.grey,
                        indent: 13,
                        endIndent: 13,
                      );
                    },
                    itemCount: 5))
          ]);
        },
      ),
    );
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(await doc.save());
    log("$file");

    return doc;
  }

  void _displayPdf() {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              'Hello eclectify Enthusiast',
              style: pw.TextStyle(fontSize: 30),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Printing"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                createPdf();
              },
              child: Text("Create and display pdf")),
          ElevatedButton(
            onPressed: _displayPdf,
            child: Text("Display Pdf"),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Advanced Pdf"))
        ],
      ),
    );
  }
}
