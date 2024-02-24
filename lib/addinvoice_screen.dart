// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:invoicemaker/invoice_screen.dart';
import 'package:invoicemaker/utils/app_preference/app_preference.dart';
import 'package:invoicemaker/widgets/button_widget.dart';
import 'package:invoicemaker/widgets/textfield_widget.dart';
import 'package:signature/signature.dart';

import 'utils/colors.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("New Invoice"),
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    InvoiceInfoScreen();
                  },
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            "INV00#",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(190, 0, 16, 29)),
                          ),
                          subtitle: Text("Add Invoice"),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(190, 0, 16, 29),
                            size: 25,
                          ),
                          onTap: () {
                            Get.to(InvoiceInfoScreen());
                          },
                        )),
                  ),
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 10,
              //   width: MediaQuery.of(context).size.width,
              //   child: GestureDetector(
              //     onTap: () {
              //       InvoiceInfoScreen();
              //     },
              //     child: Card(
              //       elevation: 10,
              //       shadowColor: Colors.grey,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: ListTil?
              //               "Templates",
              //               style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.bold,
              //                   color: Color.fromARGB(190, 0, 16, 29)),
              //             ),
              //             // subtitle: Text("Created on 05/08/2023"),
              //             trailing: Icon(
              //               Icons.arrow_forward_ios,
              //               color: Color.fromARGB(190, 0, 16, 29),
              //               size: 25,
              //             ),
              //             onTap: () {
              //               // Get.to(InvoiceInfoScreen());
              //             },
              //           )),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4.5,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    InvoiceInfoScreen();
                  },
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "From",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(190, 0, 16, 29)),
                              ),
                              subtitle: Text("Add Business"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(190, 0, 16, 29),
                                size: 25,
                              ),
                              onTap: () {
                                Get.to(BusinessInfoScreen());
                              },
                            ),
                            ListTile(
                              title: Text(
                                "Bill To",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(190, 0, 16, 29)),
                              ),
                              subtitle: Text("Add Client"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(190, 0, 16, 29),
                                size: 25,
                              ),
                              onTap: () {
                                Get.to(ClientInfoScreen());
                              },
                            )
                          ],
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Items",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(190, 0, 16, 29)),
                          ),
                          subtitle: Text(
                            "Add item",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          trailing: Icon(
                            Icons.add_circle,
                            color: Color.fromARGB(190, 0, 16, 29),
                            size: 25,
                          ),
                          onTap: () {
                            Get.to(AdditemScreen());
                          },
                        ),
                        // ListTile(
                        //   title: Text("Total"),
                        //   trailing: Text("₹0.00"),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 17),
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(190, 0, 16, 29)),
                          ),
                          SizedBox(width: 195),
                          FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('Item')
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasData) {
                                final List<DocumentSnapshot>? documents =
                                    snapshot.data?.docs;

                                int total = 0;
                                if (documents != null) {
                                  for (int i = 0; i < documents.length; i++) {
                                    total += documents[i]["Total"] as int;
                                  }
                                }

                                return Expanded(
                                  child: Text(
                                    "₹$total.00",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 8,
              //   width: MediaQuery.of(context).size.width,
              //   child: GestureDetector(
              //     onTap: () {
              //       InvoiceInfoScreen();
              //     },
              //     child: Card(
              //       elevation: 10,
              //       shadowColor: Colors.grey,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Column(
              //           children: [
              //             ListTile(
              //               title: Text(
              //                 "Signature",
              //                 style: TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color.fromARGB(190, 0, 16, 29)),
              //               ),
              //               subtitle: Text(
              //                 "Add Signature",
              //                 style: TextStyle(
              //                   fontSize: 13,
              //                 ),
              //               ),
              //               trailing: Icon(
              //                 Icons.arrow_forward_ios,
              //                 color: Color.fromARGB(190, 0, 16, 29),
              //                 size: 25,
              //               ),
              //               onTap: () {
              //                 Get.to(SignatureScreen());
              //               },
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Previewbtn(
                  //     txt: "Preview",
                  //     ontap: () {
                  //       Get.to(PreviewScrren());
                  //     },
                  //     colorr: ClrData().whtclr),
                  ButtonWidget(
                    txt: "Preview",
                    ontap: () {
                      Get.to(PreviewScrren());
                    },
                    colorr: Color.fromARGB(255, 200, 228, 252),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////1 st card invoice info
class InvoiceInfoScreen extends StatefulWidget {
  const InvoiceInfoScreen({super.key});

  @override
  State<InvoiceInfoScreen> createState() => _InvoiceInfoScreenState();
}

class _InvoiceInfoScreenState extends State<InvoiceInfoScreen> {
  @override
  void initState() {
    creation.text = "";
    due.text = "";
    super.initState();
  }

  final TextEditingController num = TextEditingController();
  final TextEditingController due = TextEditingController();
  final TextEditingController creation = TextEditingController();
  final TextEditingController title = TextEditingController();

  int inum = AppPreference().getInumber();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(" Invoice Info"),
          actions: [
            IconButton(
                onPressed: () {
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  FirebaseFirestore.instance.collection("Invoice").doc(id).set({
                    "id": id,
                    "Invoice Number": num.text,
                    "Creation Date": creation.text,
                    "Due Date": due.text,
                    "Invoice Title": title.text
                  });
                  // CollectionReference collectionReference =
                  //     FirebaseFirestore.instance.collection("Invoice");
                  // collectionReference.add({
                  //   "Invoice Number": num.text,
                  //   "Creation Date": creation.text,
                  //   "Due Date": due.text,
                  //   "Invoice Title": title.text
                  // });
                  Get.snackbar("Invoice Info", "Your Information is Saved");
                },
                icon: Icon(Icons.check)),
            SizedBox(
              width: 10,
            )
          ],
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
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Invoice Number",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ),
              InvoiceField(
                controller: num,
                hinttext: "invoice number",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Creation Date",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ),
              DateField(
                controller: creation,
                txt: "00/00/0000",
                ontap: () async {
                  DateTime? pickDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2050));
                  if (pickDate != null) {
                    setState(() {
                      debugPrint("$pickDate");

                      String formateDate =
                          DateFormat("dd/MM/yyyy").format(pickDate);
                      creation.text = formateDate;
                      debugPrint(formateDate);
                    });
                  } else {
                    debugPrint("not date found");
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Due Date",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ),
              DateField(
                  controller: due,
                  txt: "00/00/000",
                  ontap: () async {
                    DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050));
                    if (pickDate != null) {
                      setState(() {
                        debugPrint("$pickDate");

                        String formateDate =
                            DateFormat("dd/MM/yyyy").format(pickDate);
                        due.text = formateDate;
                        debugPrint(formateDate);
                      });
                    } else {
                      debugPrint("not date found");
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Invoice Title Name",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ),
              InvoiceField(
                controller: title,
                hinttext: "Invoice",
              )
            ],
          ),
        ),
      ),
    );
  }
}

////3 rd card business info

class BusinessInfoScreen extends StatefulWidget {
  const BusinessInfoScreen({super.key});

  @override
  State<BusinessInfoScreen> createState() => _BusinessInfoScreenState();
}

class _BusinessInfoScreenState extends State<BusinessInfoScreen> {
  final TextEditingController bname = TextEditingController();
  final TextEditingController eadd = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController badd = TextEditingController();
  // File? image;

  // Future<void> pickimage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imagetemp = File(image.path);
  //     setState(() {
  //       this.image = imagetemp;
  //     });
  //   } on PlatformException catch (e) {
  //     debugPrint("failed to load image:$e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Business Info"),
          actions: [
            IconButton(
                onPressed: () {
                  log("$FirebaseFirestore");
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  FirebaseFirestore.instance
                      .collection("Business")
                      .doc(id)
                      .set({
                    "id": id,
                    "Business Name": bname.text,
                    "Email Address": eadd.text,
                    "Phone": phone.text,
                    "Billing Address": badd.text
                  });
                  Get.snackbar("Business Info", "Your Information is Saved");
                },
                icon: Icon(Icons.check))
          ],
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 20,
                // ),
                // InkWell(
                //   onTap: pickimage,
                //   child: Center(
                //     child: CircleAvatar(
                //       backgroundColor: ClrData().g2,
                //       foregroundImage:
                //           image != null ? Image.file(image!).image : null,
                //       radius: 50,
                //       child: Icon(
                //         Icons.add,
                //         size: 30,
                //         color: ClrData().whtclr,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Business Name",
                    style: TextStyle(
                        color: ClrData().gryclr, fontWeight: FontWeight.w500),
                  ),
                ),
                InvoiceField(
                    controller: bname, hinttext: "Enter Business Name"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                        color: ClrData().gryclr, fontWeight: FontWeight.w500),
                  ),
                ),
                InvoiceField(
                    controller: eadd, hinttext: "Enter Business Email Address"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Phone",
                    style: TextStyle(
                        color: ClrData().gryclr, fontWeight: FontWeight.w500),
                  ),
                ),
                InvoiceField(
                    controller: phone, hinttext: "Enter Business Phone Number"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Billing Address",
                    style: TextStyle(
                        color: ClrData().gryclr, fontWeight: FontWeight.w500),
                  ),
                ),
                InvoiceField(
                    controller: badd, hinttext: "Enter Billing Address"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///////4 th card invoice info screen
class ClientInfoScreen extends StatefulWidget {
  const ClientInfoScreen({super.key});

  @override
  State<ClientInfoScreen> createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen> {
  final TextEditingController cname = TextEditingController();
  final TextEditingController eadd = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController badd = TextEditingController();
  final TextEditingController sadd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Client Info"),
          actions: [
            IconButton(
                onPressed: () {
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  FirebaseFirestore.instance.collection("Client").doc(id).set({
                    "id": id,
                    "Client Name": cname.text,
                    "Email Address": eadd.text,
                    "Phone": phone.text,
                    "Billing Address": badd.text,
                    "Shipping Address": sadd.text,
                  });

                  // CollectionReference collectionReference =
                  //     FirebaseFirestore.instance.collection("Client");
                  // collectionReference.add({
                  //   "Client Name": cname.text,
                  //   "Email Address": eadd.text,
                  //   "Phone": phone.text,
                  //   "Billing Address": badd.text,
                  //   "Shipping Address": sadd.text,
                  // });
                  Get.snackbar("Client Info", "Your Information is Saved");
                },
                icon: Icon(Icons.check))
          ],
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Client Name",
                    style: TextStyle(
                        color: ClrData().gryclr, fontWeight: FontWeight.w500),
                  ),
                ),
                InvoiceField(controller: cname, hinttext: "Enter Client Name"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                        color: ClrData().gryclr, fontWeight: FontWeight.w500),
                  ),
                ),
                InvoiceField(
                    controller: eadd, hinttext: "Enter Client Email Address"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Phone",
                    style: TextStyle(
                        color: ClrData().gryclr, fontWeight: FontWeight.w500),
                  ),
                ),
                InvoiceField(
                    controller: phone, hinttext: "Enter Client Phone Name"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Billing Address",
                    style: TextStyle(
                        color: ClrData().gryclr, fontWeight: FontWeight.w500),
                  ),
                ),
                InvoiceField(
                    controller: badd, hinttext: "Enter Billing Address"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Shipping Address",
                    style: TextStyle(
                        color: ClrData().gryclr, fontWeight: FontWeight.w500),
                  ),
                ),
                InvoiceField(
                    controller: sadd, hinttext: "Enter Billing Address"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////5 th card items

class AdditemScreen extends StatefulWidget {
  const AdditemScreen({super.key});

  @override
  State<AdditemScreen> createState() => _AdditemScreenState();
}

class _AdditemScreenState extends State<AdditemScreen> {
  bool isSelected = false;
  bool isSelectedoff = false;
  final TextEditingController itemname = TextEditingController();
  final TextEditingController itemprice = TextEditingController();
  final TextEditingController itemquantity = TextEditingController();

  //  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;
  int? total;

  @override
  void initState() {
    total = 0;
    super.initState();
  }

  void calculation() {
    setState(() {
      total = int.parse(itemprice.text) * int.parse(itemquantity.text);
    });
    log("$total");
  }

  void clearText() {
    itemname.clear();
    itemprice.clear();
    itemquantity.clear();
  }

  List<Map<String, dynamic>> datalst = [];

  void addData({int? id}) {
    if (id != null) {
      itemname.text = datalst[id]['iname'];
      itemprice.text = datalst[id]['iprice'];
      total = datalst[id]['total'];
    } else {
      clearText();
    }
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: SizedBox(
                height: 450,
                width: 320,
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Spacer(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Center(
                          child: Text(
                            isSelected == true ? "Edit Item" : "New Item",
                            style: TextStyle(
                                color: ClrData().gryclr,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                letterSpacing: 1),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Item Name",
                            style: TextStyle(
                                color: ClrData().gryclr,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        InvoiceField(
                            controller: itemname, hinttext: "Enter Item Name"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Item Price",
                            style: TextStyle(
                                color: ClrData().gryclr,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        InvoiceField(
                          controller: itemprice,
                          hinttext: "₹0.00",
                          inputtype: TextInputType.number,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Item Quantity",
                            style: TextStyle(
                                color: ClrData().gryclr,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        InvoiceField(
                          controller: itemquantity,
                          hinttext: "0",
                          inputtype: TextInputType.number,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     "Item Discount",
                        //     style: TextStyle(
                        //         color: ClrData().gryclr,
                        //         fontWeight: FontWeight.w500),
                        //   ),
                        // ),
                        // InvoiceField(
                        //     controller: itemdiscount, hinttext: "0%"),

                        // InvoiceField(
                        //     controller: name, hinttext: "ENTER NAME"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),

                        Center(
                          child: ButtonWidget(
                            txt: "Add",
                            ontap: () {
                              calculation();
                              final Map<String, dynamic> data = {
                                "iname": itemname.text,
                                "iprice": itemprice.text,
                                "total": total
                              };
                              if (id != null) {
                                datalst[id] = data;
                              } else {
                                datalst.add(data);
                              }
                              Navigator.of(context).pop();
                              // setState(() {
                              //   isSelected = false;
                              // });
                            },
                            colorr: ClrData().g2,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: isSelected == true ? Text("New Item") : Text("Add Item"),
            actions: [
              IconButton(
                onPressed: () {
                  String id = DateTime.now().millisecondsSinceEpoch.toString();

                  FirebaseFirestore.instance.collection("Item").doc(id).set({
                    "id": id,
                    "Item Name": itemname.text,
                    "Item Price": itemprice.text,
                    "Item Quantity": itemquantity.text,
                    "Total": total
                  });

                  Get.snackbar("Items", "Your Information is Saved");
                },
                icon: Icon(Icons.check),
              ),
            ],
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
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ClrData().g2,
            onPressed: () {
              setState(() {
                isSelected = false;
              });
              addData();
            },
            child: Icon(Icons.add),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection("Item").get(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                // ignore: body_might_complete_normally_nullable
                itemBuilder: (context, index) {
                  final List<DocumentSnapshot>? documents = snapshot.data?.docs;
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                        child: Card(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  documents?[index]["Item Name"],
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  documents![index]["Total"].toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    itemname.text =
                                        snapshot.data!.docs[index]['Item Name'];
                                    itemprice.text = snapshot.data!.docs[index]
                                        ['Item Price'];
                                    itemquantity.text = snapshot
                                        .data!.docs[index]['Item Quantity'];

                                    String id =
                                        snapshot.data!.docs[index]['id'];

                                    showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return Center(
                                              child: SizedBox(
                                                height: 450,
                                                width: 320,
                                                child: Material(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Spacer(),
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              50,
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            isSelected == true
                                                                ? "Edit Item"
                                                                : "New Item",
                                                            style: TextStyle(
                                                                color: ClrData()
                                                                    .gryclr,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 20,
                                                                letterSpacing:
                                                                    1),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              50,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "Item Name",
                                                            style: TextStyle(
                                                                color: ClrData()
                                                                    .gryclr,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        InvoiceField(
                                                            controller:
                                                                itemname,
                                                            hinttext:
                                                                "Enter Item Name"),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "Item Price",
                                                            style: TextStyle(
                                                                color: ClrData()
                                                                    .gryclr,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        InvoiceField(
                                                          controller: itemprice,
                                                          hinttext: "₹0.00",
                                                          inputtype:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "Item Quantity",
                                                            style: TextStyle(
                                                                color: ClrData()
                                                                    .gryclr,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        InvoiceField(
                                                          controller:
                                                              itemquantity,
                                                          hinttext: "0",
                                                          inputtype:
                                                              TextInputType
                                                                  .number,
                                                        ),

                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              30,
                                                        ),

                                                        Center(
                                                          child: ButtonWidget(
                                                            txt: "Edit",
                                                            ontap: () {
                                                              calculation();

                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'Item')
                                                                  .doc(id)
                                                                  .update({
                                                                "id": id,
                                                                "Item Name":
                                                                    itemname
                                                                        .text,
                                                                "Item Price":
                                                                    itemprice
                                                                        .text,
                                                                "Item Quantity":
                                                                    itemquantity
                                                                        .text,
                                                                "Total": total
                                                              }).then((value) {
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            colorr:
                                                                ClrData().g2,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ).whenComplete(() => setState(() {}));

                                    setState(() {
                                      isSelected = true;
                                    });
                                    addData(id: index);
                                    log('$index');
                                  },
                                  icon: Icon(Icons.edit_rounded)),
                              IconButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Item')
                                        .doc(snapshot.data!.docs[index]['id'])
                                        .delete();

                                    setState(() {
                                      // CollectionReference collectionReference =
                                      //     FirebaseFirestore.instance
                                      //         .collection("Invoice");
                                      // collectionReference
                                      //     .doc(datalst[index])
                                      //     .delete();
                                      // datalst.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete_outline_rounded))
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          )),
    );
  }
}

class NewitemScreen extends StatefulWidget {
  const NewitemScreen({super.key});

  @override
  State<NewitemScreen> createState() => _NewitemScreenState();
}

class _NewitemScreenState extends State<NewitemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Item"),
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
      ),
    );
  }
}

/////signature Screen
class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final SignatureController controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    // exportBackgroundColor: Colors.blue.shade100,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Signature"),
        actions: [
          GestureDetector(
              onTap: () {
                controller.clear();
              },
              child: Icon(Icons.delete_outline_outlined)),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.check,
          ),
          SizedBox(
            width: 10,
          ),
        ],
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
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 90,
          // ),
          Signature(
            controller: controller,
            height: 300,
            // width: 250,
            backgroundColor: Colors.white,
          )
        ],
      ),
    );
  }
}

//preview screen
class PreviewScrren extends StatefulWidget {
  const PreviewScrren({super.key});

  @override
  State<PreviewScrren> createState() => _PreviewScrrenState();
}

class _PreviewScrrenState extends State<PreviewScrren> {
  final headers = [
    'DESCRIPTION',
    'QTY',
    'PRICE',
    'AMOUNT',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Preview"),
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
      ),
      body: SizedBox(
        // height: MediaQuery.of(context).size.height / 1.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 560,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                        color: const Color.fromARGB(255, 202, 202, 202),
                        width: 3)),
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      ///invoie detail
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 5, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FutureBuilder<QuerySnapshot>(
                                  future: FirebaseFirestore.instance
                                      .collection('Invoice')
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final List<DocumentSnapshot>? documents =
                                          snapshot.data?.docs;
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            documents?.first["Invoice Title"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 25),
                                          ),
                                          // Text(
                                          //   documents?.first["Creation Date"],
                                          //   style: TextStyle(fontSize: 9),
                                          // ),
                                          // Text(
                                          //   documents?.first["Due Date"],
                                          //   style: TextStyle(fontSize: 9),
                                          // ),
                                        ],
                                      );
                                    }
                                    return Container();
                                  },
                                ),
                                // Text(
                                //   "INVOICE",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.w700,
                                //       fontSize: 25),
                                // ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "INVOICE#",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "CREATION DATE",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "DUE DATE",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                                // Row(
                                //   // crossAxisAlignment: CrossAxisAlignment.end,
                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //   children: [
                                //     Text("INVOICE#"),
                                //     Text("INV00001"),
                                //   ],
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //   // crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     Text("CREATION DATE"),
                                //     Text("08/09/2023"),
                                //   ],
                                // ),
                                // Row(
                                //   // crossAxisAlignment: CrossAxisAlignment.end,
                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //   children: [
                                //     Text("DUE DATE"),
                                //     Text("17/09/2023"),
                                //   ],
                                // ),
                              ],
                            ),
                            FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('Invoice')
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final List<DocumentSnapshot>? documents =
                                      snapshot.data?.docs;
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        documents?.first["Invoice Number"],
                                        style: TextStyle(fontSize: 9),
                                      ),
                                      Text(
                                        documents?.first["Creation Date"],
                                        style: TextStyle(fontSize: 9),
                                      ),
                                      Text(
                                        documents?.first["Due Date"],
                                        style: TextStyle(fontSize: 9),
                                      ),
                                    ],
                                  );
                                }
                                return Container();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Divider(
                        color: Colors.grey,
                        indent: 13,
                        endIndent: 13,
                      ),
                      //business and client information
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "FROM",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                              FutureBuilder<QuerySnapshot>(
                                  future: FirebaseFirestore.instance
                                      .collection('Business')
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final List<DocumentSnapshot>? documents =
                                          snapshot.data?.docs;
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              documents?.first["Business Name"],
                                              style: TextStyle(fontSize: 9)),
                                          Text(
                                              documents?.first["Email Address"],
                                              style: TextStyle(fontSize: 9)),
                                          Text(documents?.first["Phone"],
                                              style: TextStyle(fontSize: 9)),
                                          Text(
                                              documents
                                                  ?.first["Billing Address"],
                                              style: TextStyle(fontSize: 9)),
                                        ],
                                      );
                                    }
                                    return Container();
                                  }),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BILL TO",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                              FutureBuilder<QuerySnapshot>(
                                future: FirebaseFirestore.instance
                                    .collection('Client')
                                    .get(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final List<DocumentSnapshot>? documents =
                                        snapshot.data?.docs;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(documents?.first["Client Name"],
                                            style: TextStyle(fontSize: 9)),
                                        Text(documents?.first["Email Address"],
                                            style: TextStyle(fontSize: 9)),
                                        Text(documents?.first["Phone"],
                                            style: TextStyle(fontSize: 9)),
                                        Text(
                                            documents
                                                    ?.first["Billing Address"] +
                                                " , " +
                                                documents
                                                    ?.first["Shipping Address"],
                                            style: TextStyle(fontSize: 9)),
                                      ],
                                    );
                                  }
                                  return Container();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      // DataTable(columns: , rows: )
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        width: 350,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 180, 180, 180),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                "DESCRIPTION",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "QTY",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "PRICE",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "AMOUNT",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Expanded(
                      //   child: ListView.builder(
                      //     itemCount: 3,
                      //     itemBuilder: (context, index) {
                      //       return Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           Text("Chocolate"),
                      //           Text("1"),
                      //           Text("100"),
                      //           Text("100")
                      //         ],
                      //       );
                      //     },
                      //   ),
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        child: FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('Item')
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasData) {
                              final List<DocumentSnapshot>? documents =
                                  snapshot.data?.docs;

                              return ListView.separated(
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 350,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                            child: Text(documents?[index]
                                                ["Item Name"])),
                                        Expanded(
                                            child: Text(documents?[index]
                                                ["Item Quantity"])),
                                        Expanded(
                                            child: Text(documents?[index]
                                                ["Item Price"])),
                                        Expanded(
                                            child: Text(
                                                "${documents?[index]["Total"]}")),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: Colors.grey,
                                    indent: 13,
                                    endIndent: 13,
                                  );
                                },
                                
                                itemCount: documents?.length ?? 0,
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.98,
                          ),
                          Text(
                            "Total",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 11,
                          ),
                          FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('Item')
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasData) {
                                final List<DocumentSnapshot>? documents =
                                    snapshot.data?.docs;

                                int total = 0;
                                if (documents != null) {
                                  for (int i = 0; i < documents.length; i++) {
                                    total += documents[i]["Total"] as int;
                                  }
                                }

                                return Text(
                                  "₹$total.00",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                );
                              }
                              return Container();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ClrData().g2,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.snackbar(
                            "Downloaded", "File Downloaded Successfully");
                        Get.to(InvoiceScreen());
                      },
                      icon: Icon(
                        Icons.file_download_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
