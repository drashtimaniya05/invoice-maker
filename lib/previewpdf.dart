// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  Future<List<Map<String, dynamic>>> fetchInvoice() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Invoice').get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((DocumentSnapshot document) =>
            document.data() as Map<String, dynamic>)
        .toList();
    return data;
  }

  Future<List<Map<String, dynamic>>> fetchBusiness() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Business').get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((DocumentSnapshot document) =>
            document.data() as Map<String, dynamic>)
        .toList();
    return data;
  }

  Future<List<Map<String, dynamic>>> fetchClient() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Client').get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((DocumentSnapshot document) =>
            document.data() as Map<String, dynamic>)
        .toList();
    return data;
  }

  Future<List<Map<String, dynamic>>> fetchItem() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Item').get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((DocumentSnapshot document) =>
            document.data() as Map<String, dynamic>)
        .toList();
    return data;
  }

  Future<Uint8List> generatePdf(
    List<Map<String, dynamic>> firestoreinvoice,
    List<Map<String, dynamic>> firestorebusiness,
    List<Map<String, dynamic>> firestoreclient,
    List<Map<String, dynamic>> firestoreitem,
  ) async {
    final pdf = pw.Document();

    // Add content to the PDF based on Firestore data

    for (var business in firestorebusiness) {
      for (var client in firestoreclient) {
        for (var item in firestoreitem) {
          pdf.addPage(pw.Page(
            build: (context) {
              return pw.Column(children: <pw.Widget>[
                //  pw.Text(invoice['Invoice Number'] ?? ''),
              ]);
            },
          ));
        }
      }
    }

    // pdf.addPage(pw.Page(
    //   build: (pw.Context context) {
    //     return pw.Column(children: [
    //       //  pw.Text(invoice['Invoice Number'] ?? ''),
    //       //pw.Text('Invoice Number:${firestoreinvoice['Invoice Number'] ?? ""}'),
    //       //  pw.Text(item['Client Name'] ?? ''),

    //       //  pw.Text(invoice['Creation Date'] ?? ''),
    //       //  pw.Text(invoice['Due Date'] ?? ''),
    //       // pw.Text(invoice['Total'] ?? int),
    //     ]);
    //   },
    // ));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example1.pdf');
    await file.writeAsBytes(await pdf.save());
    log("$file");

    return pdf.save();
  }

  Future<void> savePdf(Uint8List pdfBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_pdf.pdf');
    await file.writeAsBytes(pdfBytes);
  }
// Trigger PDF generation and saving

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                List<Map<String, dynamic>> firestoreinvoice =
                    await fetchInvoice();
                List<Map<String, dynamic>> firestorebusiness =
                    await fetchBusiness();
                List<Map<String, dynamic>> firestoreclient =
                    await fetchClient();
                List<Map<String, dynamic>> firestoreitem = await fetchItem();

                Uint8List pdfBytes = await generatePdf(firestoreinvoice,
                    firestorebusiness, firestoreclient, firestoreitem);
                await savePdf(pdfBytes);
                // generatePdf(firestoreData);
              },
              child: Text("Display PDF"))
        ],
      ),
    );
  }
}
