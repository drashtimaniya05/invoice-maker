import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invoicemaker/widgets/textfield_widget.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  TextEditingController txtname = TextEditingController();

  Future signUp() async {
    final signup = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: txtemail.text.trim(), password: txtpass.text.trim());
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore.instance.collection("auths").doc(id).set({
      "id": id,
      "email": txtemail.text,
      "name": txtname.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          InvoiceField(controller: txtemail, hinttext: "Enter emil"),
          InvoiceField(controller: txtpass, hinttext: "Enter emil"),
          InvoiceField(controller: txtname, hinttext: "Enter Passwolrd"),
          ElevatedButton(
              onPressed: () {
                signUp();
              },
              child: Text("Sign Up"))
        ],
      ),
    );
  }
}
