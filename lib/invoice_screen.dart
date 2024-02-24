import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:invoicemaker/utils/colors.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // height: MediaQuery.of(context).size.height / 1.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 560,
              child: Card(
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(15),
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
                              children: const [
                                Text(
                                  "INVOICE",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
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
                          children: const [
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
                        height: MediaQuery.of(context).size.height / 6,
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
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        "*Payment Cash Only",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 80,
            //   width: 350,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         height: 60,
            //         width: 60,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           color: ClrData().g2,
            //         ),
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: Icon(
            //             Icons.file_download_outlined,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
