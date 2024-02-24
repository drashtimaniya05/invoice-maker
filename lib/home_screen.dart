// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:invoicemaker/addinvoice_screen.dart';
import 'package:invoicemaker/profile_screen.dart';

import 'utils/colors.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  Future getData() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("Invoice").get();
    // QuerySnapshot qnn = await firestore.collection("users").get();
    return qn.docs;
    //  return qnn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Invoices"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                ClrData().g1,
                ClrData().g2,
                ClrData().g3,
              ])),
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 120,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Invoice Number:",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(190, 0, 16, 29)),
                                  ),
                                  Text(snapshot.data[index]["Invoice Number"]),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  //  Text("Unknown Client")
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Creation Date:",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(190, 0, 16, 29)),
                                  ),
                                  Text(snapshot.data[index]["Creation Date"]),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  // Text("\$0.00")
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Due Date:",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(190, 0, 16, 29)),
                                  ),

                                  Text(snapshot.data[index]["Due Date"]),
                                  // SizedBox(
                                  //   width: 150,
                                  // ),
                                  // Text("Unknown Client")
                                ],
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int index = 1;
  final screens = [
    Home_Screen(),
    AddScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home_filled,
        color: Colors.white,
      ),
      Icon(
        Icons.add,
        size: 35,
        color: Colors.white,
      ),
      Icon(
        Icons.person,
        color: Colors.white,
      )
    ];
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        color: Colors.lightBlueAccent.shade100,
        // buttonBackgroundColor: Colors.white,
        items: items,
        height: 60,
        index: index,
        onTap: (index) => setState(() => this.index = index),
      ),
      body: screens[index],
    );
  }
}
