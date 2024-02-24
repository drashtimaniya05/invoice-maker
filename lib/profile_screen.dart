// ignore_for_file: unused_import

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoicemaker/login_screen.dart';
import 'package:invoicemaker/signup_screen.dart';
import 'package:invoicemaker/utils/app_preference/preference_key.dart';
import 'package:invoicemaker/widgets/button_widget.dart';
import 'package:invoicemaker/widgets/textfield_widget.dart';

import 'controller/login_controller.dart';
import 'utils/colors.dart';
import 'utils/text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  File? image;
  Future<void> pickimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
      });
    } on PlatformException catch (e) {
      debugPrint("failed to load image:$e");
    }
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final LoginController obj = Get.put(LoginController());
  updatePassword() {
    obj.isVisible.value = !obj.isVisible.value;
  }

  String uid = DateTime.now().millisecondsSinceEpoch.toString();

  @override
  void initState() {
    emailController.text =
        PreferencesKey.instance.getString(PreferencesKey.isEmail) ?? "";
    usernamecontroller.text =
        PreferencesKey.instance.getString(PreferencesKey.isUserName) ?? "";
    numbercontroller.text =
        PreferencesKey.instance.getString(PreferencesKey.isMobileNum) ?? "";
    passwordController.text =
        PreferencesKey.instance.getString(PreferencesKey.isPassword) ?? "";
    uid = PreferencesKey.instance.getString(PreferencesKey.uID) ?? "";

    super.initState();
  }

  void userData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection("users").doc(uid).update({
      "uid": uid,
      "userName": usernamecontroller.text,
      "email": emailController.text,
      "mobile": numbercontroller.text,
      "password": passwordController.text,
    });
  }

  void getData() {}
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profile"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ClrData().g1,
                  ClrData().g2,
                  ClrData().g3,
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  try {
                    // await PreferencesKey.instance.clear();

                    //  log("$_auth");
                    //  await _auth.signOut();
                    Get.to(LoginScreen());
                    // Log out the user
                    // Navigate to another screen or show a success message
                  } catch (e) {
                    // Handle errors, such as Firebase exceptions
                    debugPrint(e.toString());
                  }
                },
                icon: Icon(Icons.logout)),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                GestureDetector(
                  onTap: pickimage,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: ClrData().g2,
                      foregroundImage:
                          image != null ? Image.file(image!).image : null,
                      radius: 70,
                      child: Icon(
                        Icons.photo_camera_back_rounded,
                        size: 30,
                        color: ClrData().whtclr,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                //  Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text(
                //       "Enter",
                //       style: TextStyle(
                //           color: ClrData().gryclr, fontWeight: FontWeight.w500),
                //     ),
                //   ),

                InvoiceField(
                    validatorr: (value) {
                      if (value!.isEmpty) {
                        return "reqiured..!";
                      }
                      return null;
                    },
                    controller: usernamecontroller,
                    hinttext: "UserName"),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     "Email Address",
                //     style: TextStyle(
                //         color: ClrData().gryclr, fontWeight: FontWeight.w500),
                //   ),
                // ),
                InvoiceField(
                    validatorr: (value) {
                      if (value!.isEmpty) {
                        return "Email is reqired...";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Enter Proper Format..";
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
                    hinttext: "Email address"),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     "Phone",
                //     style: TextStyle(
                //         color: ClrData().gryclr, fontWeight: FontWeight.w500),
                //   ),
                // ),
                InvoiceField(
                    validatorr: (value) {
                      if (value!.isEmpty) {
                        return "reqiured..!";
                      } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                          .hasMatch(value)) {
                        return "enter valid mobile number..!";
                      }
                      return null;
                    },
                    controller: numbercontroller,
                    hinttext: "Mobie Number"),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Obx(() => ProfilePassword(
                    validatorr: (value) {
                      if (value!.isEmpty) {
                        return "reqiured..!";
                      }
                      return null;
                    },
                    passwordController: passwordController,
                    hinttxt: Txtdata().passtxt,
                    obscureText: obj.isVisible.value ? true : false,
                    btn: updatePassword,
                    icn: obj.isVisible.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    inputType: TextInputType.visiblePassword)),
                SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                    txt: "Save",
                    ontap: () {
                      if (globalKey.currentState!.validate()) {
                        userData();
                      }
                    },
                    colorr: ClrData().g2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextButton(
                //         onPressed: () async {
                //           try {
                //             await PreferencesKey.instance.clear();

                //             // log("$_auth");
                //             // await _auth.signOut();
                //             Get.to(LoginScreen());
                //             // Log out the user
                //             // Navigate to another screen or show a success message
                //           } catch (e) {
                //             // Handle errors, such as Firebase exceptions
                //             print(e.toString());
                //           }
                //         },
                //         child: Text(
                //           "LOG OUT",
                //           style:
                //               TextStyle(decoration: TextDecoration.underline),
                //         ))
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
