// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:invoicemaker/home_screen.dart';
import 'package:invoicemaker/login_screen.dart';

import 'package:invoicemaker/utils/app_preference/preference_key.dart';

import 'controller/login_controller.dart';
import 'utils/colors.dart';
import 'utils/images.dart';
import 'utils/text.dart';
import 'widgets/button_widget.dart';
import 'widgets/textfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final auth = FirebaseAuth.instance;
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final LoginController obj = Get.put(LoginController());
  // ignore: non_constant_identifier_names
  Updatepassword() {
    obj.isVisiblee.value = !obj.isVisiblee.value;
  }

  updatepassword() {
    obj.isVisiblee.value = !obj.isVisiblee.value;
  }

  final formKey = GlobalKey<FormState>();

  void submit() {
    final isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      _signUpWithEmailAndPassword();
      return;
    }
    formKey.currentState!.save();
  }

  // Future<void> signUp() async {
  //   if (password != null) {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: email, password: password);
  //       Get.snackbar("Success", "Registration successfully");
  //       // Get.to(BottomNavigationScreen());
  //     } on FirebaseAuthException catch (e) {
  //       log("$e");
  //     }
  //   }
  // }
  // void signUp() async {
  //   UserCredential userCred = await _auth.createUserWithEmailAndPassword(
  //       email: emailcontroller.text, password: passwordcontroller.text);
  //   if (userCred.user != null) {
  //     print(userCred.user!.email);
  //     print('success');
  //   } else {
  //     print('error');
  //   }
  // }
  Future<void> _signUpWithEmailAndPassword() async {
    try {
      final String email = emailcontroller.text.trim();
      final String password = passwordcontroller.text.trim();

      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      if (userCredential.user != null) {
        // String id = DateTime.now().millisecondsSinceEpoch.toString();
        // Successfully signed up
        // AppPreference().setIsLogin(user.emailVerified);
        try {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            "email": emailcontroller.text,
            "userName": usernamecontroller.text,
            "password": passwordcontroller.text,
            "moblie": numbercontroller.text,
            "uid": userCredential.user!.uid,
          });
          await PreferencesKey.instance.setBool(PreferencesKey.isLogin, true);
          await PreferencesKey.instance
              .setString(PreferencesKey.uID, userCredential.user!.uid);
          await PreferencesKey.instance
              .setString(PreferencesKey.isUserName, usernamecontroller.text);
          await PreferencesKey.instance
              .setString(PreferencesKey.isEmail, emailcontroller.text);
          await PreferencesKey.instance
              .setString(PreferencesKey.isPassword, passwordcontroller.text);
          await PreferencesKey.instance
              .setString(PreferencesKey.isMobileNum, numbercontroller.text);
        } catch (e) {
          log('$e');
        }
        log('Signed up: ${user?.email}');
        Get.to(BottomNavigationScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Weak-password') {
        Get.snackbar("Error", "Password provided is too Weak");
      } else if (e.code == "email-already-in-use") {
        Get.snackbar("Error", "Account Already exists");
      }
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.lightBlueAccent.shade100,
              Colors.lightBlueAccent
            ],
          ),
        ),
        child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  ImageData().signimg,
                  height: 250,
                ),
                Text(
                  Txtdata().wlcsign,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  Txtdata().suslogn,
                  style: TextStyle(color: ClrData().lscolor),
                ),
                SizedBox(
                  height: 20,
                ),
                // const Text("Start a new account"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    validatorr: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "Please Enter Correct Name";
                      } else {
                        return null;
                      }
                    },
                    controller: usernamecontroller,
                    hinttxt: Txtdata().uname,
                    inputType: TextInputType.name,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                    inputType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    hinttxt: Txtdata().emailtxt,
                    validatorr: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return "Please Enter Valid Email";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(
                      inputType: TextInputType.phone,
                      validatorr: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                .hasMatch(value)) {
                          return "Please Enter Valid Phone Number";
                        }
                      },
                      controller: numbercontroller,
                      hinttxt: "Enter Your Number"),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => PasswordTextfield(
                      passwordController: passwordcontroller,
                      hinttxt: Txtdata().passtxt,
                      obscureText: obj.isVisiblee.value ? true : false,
                      btn: Updatepassword,
                      icn: obj.isVisiblee.value
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      inputType: TextInputType.visiblePassword,
                      inputformaters: const [],
                      validatorr: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                          return "Please Enter Valid Password";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                  txt: Txtdata().sigtxt,
                  ontap: () async {
                    submit();
                    // await auth.createUserWithEmailAndPassword(
                    //     email: emailcontroller.text,
                    //     password: passwordcontroller.text);
                    //  _signUpWithEmailAndPassword();
                    // registration()s;
                    // Get.to(BottomNavigationScreen());
                  },
                  colorr: const Color.fromARGB(255, 184, 207, 226),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Txtdata().alAccount,
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      style: ButtonStyle(),
                      child: Text(
                        Txtdata().logtxt,
                        style: TextStyle(
                            color: ClrData().whtclr,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
