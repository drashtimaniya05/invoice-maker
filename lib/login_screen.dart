// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, avoid_print

// ignore: unused_import
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:invoicemaker/home_screen.dart';
import 'package:invoicemaker/signup_screen.dart';
// ignore: unused_import
import 'package:invoicemaker/utils/regExpression.dart';

import 'controller/login_controller.dart';
import 'utils/app_preference/preference_key.dart';
import 'utils/colors.dart';
import 'utils/images.dart';
import 'utils/text.dart';
import 'widgets/button_widget.dart';
import 'widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController obj = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  UpdatePassword() {
    obj.isVisible.value = !obj.isVisible.value;
  }

  final formKey = GlobalKey<FormState>();
  // Future<UserCredential?> userSignin() async {
  //   try {
  //     final userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //     if (userCredential.user != null) {
  //       FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //       DocumentSnapshot data = await firebaseFirestore
  //           .collection("users")
  //           .doc(userCredential.user!.uid)
  //           .get();
  //       await PreferencesKey.instance.setBool(PreferencesKey.isLogin, true);
  //       await PreferencesKey.instance
  //           .setString(PreferencesKey.isEmail, emailController.text);
  //       await PreferencesKey.instance
  //           .setString(PreferencesKey.uID, userCredential.user!.uid);
  //       await PreferencesKey.instance
  //           .setString(PreferencesKey.isMobileNum, data['mobile']);
  //       await PreferencesKey.instance
  //           .setString(PreferencesKey.isUserName, data['userName']);
  //       return userCredential;
  //     } else {
  //       print("---------------  $userCredential");
  //       return null;
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     log("$e");
  //     return null;
  //   }
  // }
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: "ddd@gmail.com",
        password: "1234567890",
      );
      print("----------------     $email  ++++++   $password");
      // ignore: unused_local_variable
      User? user = userCredential.user;
      Get.to(BottomNavigationScreen());
      // Navigate to the next screen or perform necessary actions after successful sign-in.
    } catch (e) {
      print("----------------  ==========   $email  ++++++   $password");
      print('Error: $e');
      // Handle sign-in errors, e.g., display an error message to the user.
    }
  }

  String email = " ", password = " ";
  void submit() {
    final isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      return;
    }
    formKey.currentState!.save();
  }

  void userData() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (userCredential.user != null) {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        DocumentSnapshot data = await firebaseFirestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .get();
        await PreferencesKey.instance.setBool(PreferencesKey.isLogin, true);
        await PreferencesKey.instance
            .setString(PreferencesKey.isEmail, emailController.text);
        await PreferencesKey.instance
            .setString(PreferencesKey.uID, userCredential.user!.uid);
        await PreferencesKey.instance
            .setString(PreferencesKey.isMobileNum, data['mobile']);
        await PreferencesKey.instance
            .setString(PreferencesKey.isUserName, data['userName']);

        await PreferencesKey.instance
            .setString(PreferencesKey.isPassword, passwordController.text);
      }

      Get.to(BottomNavigationScreen());
    } catch (e) {
      Get.snackbar("Error", "Invalid Password");
      // ignore: use_build_context_synchronously
      // Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(79, 4, 18, 48),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Color(0xFF73AEF5),
              // Color(0xFF61A4F1),
              // Color(0xFF478DE0),
              // Color.fromARGB(255, 31, 123, 230),
              // Colors.white,
              // Colors.lightBlueAccent.shade100,
              // Colors.lightBlueAccent,

              ClrData().g1,
              ClrData().g2,
              ClrData().g3,
            ],
          ),
        ),
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),

                Image.asset(ImageData().logimg, height: 250),
                Text(
                  Txtdata().hellotxt,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 0.6),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  Txtdata().lslogn,
                  style: TextStyle(color: ClrData().lscolor),
                ),
                ///////////////// "Collaborate, create, and conquer!"

                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  inputType: TextInputType.emailAddress,
                  controller: emailController,
                  hinttxt: Txtdata().emailtxt,
                  validatorr: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    } else {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Please Enter Valid Email";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => PasswordTextfield(
                    passwordController: passwordController,
                    hinttxt: Txtdata().passtxt,
                    obscureText: obj.isVisible.value ? true : false,
                    btn: UpdatePassword,
                    icn: obj.isVisible.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    inputType: TextInputType.visiblePassword,
                    // inputformaters: [],
                    validatorr: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter password";
                      } else {
                        if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value)) {
                          return "Please Enter Valid password";
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                ),
                // Container(
                //   height: 60,
                //   alignment: Alignment.centerLeft,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.black26,
                //             blurRadius: 6,
                //             offset: Offset(0, 2))
                //       ]),
                //   child: TextFormField(
                //     keyboardType: TextInputType.emailAddress,
                //     style: TextStyle(color: Colors.black87),
                //     decoration: InputDecoration(
                //         border: InputBorder.none,
                //         contentPadding: EdgeInsets.only(top: 14),
                //         prefixIcon: Icon(
                //           Icons.email,
                //           color: ClrData().g2,
                //         ),
                //         hintText: "Email",
                //         hintStyle: TextStyle(color: Colors.black38)),
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                // Container(
                //   height: 45,
                //   width: 150,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(
                //     child: Text(
                //       Txtdata().logtxt,
                //       style: TextStyle(
                //           color: Colors.blue.shade600,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 330,
                //   height: 50,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     style: ButtonStyle(
                //         backgroundColor:
                //             MaterialStateProperty.all(ClrData().whtclr),
                //         elevation: MaterialStateProperty.all(5),
                //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //           RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(25),
                //           ),
                //         ),
                //         overlayColor:
                //             MaterialStateProperty.all(ClrData().whtclr)),
                //     child: Text(
                //       "Log In",
                //       style: TextStyle(color: ClrData().logclr),
                //     ),
                //   ),
                // ),
                ButtonWidget(
                  txt: Txtdata().logtxt,
                  ontap: () async {
                    submit();
                    if (emailController.text.isEmpty &&
                        passwordController.text.isEmpty) {
                      Get.snackbar("Error", "Please Enter Email and Password");
                      // SnackBar(content: Text("Enter your email & password"));
                    } else {
                      // userData();
                      try {
                        //userData();
                        await auth.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                        Get.to(BottomNavigationScreen());
                      } catch (e) {
                        Get.snackbar("Error", "Enter Valid Details..");
                      }

                      // signInWithEmailAndPassword(email, password);
                    }

                    // if (formKey.currentState!.validate()) {
                    //   submit();
                    //   signInWithEmailAndPassword(email, password);
                    //   // Get.to(
                    //   //     BottomNavigationScreen()); //error ave che? ke aebi nai ruk batavu
                    // }
                    // Get.to(BottomNavigationScreen());
                    // if (formKey.currentState!.validate()) {
                    //   _submit();
                    //   Get.to(BottomNavigationScreen());
                    // }
                  },
                  colorr: Color.fromARGB(255, 189, 237, 252),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       height: 1,
                //       width: 30,
                //       color: Color.fromARGB(255, 255, 255, 255),
                //     ),
                //     Text(
                //       " Or Login With ",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     Container(
                //       height: 1,
                //       width: 30,
                //       color: ClrData().whtclr,
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 50,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   // crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     CircleAvatar(
                //       radius: 20,
                //       backgroundColor: ClrData().whtclr,
                //       child: Text("G"),
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     CircleAvatar(
                //       radius: 20,
                //       child: Text("f"),
                //     )
                //   ],
                // ),

                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Txtdata().acctxt,
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignUpScreen());
                      },
                      style: ButtonStyle(),
                      child: Text(
                        Txtdata().sigtxt,
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
