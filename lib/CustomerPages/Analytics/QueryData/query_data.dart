import 'dart:convert';

import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:cgi_app/CustomerPages/Analytics/data_table.dart';
import 'package:cgi_app/CustomerPages/Sidebar/sidebar_v2.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class QueryData extends StatefulWidget {
  const QueryData({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _QueryData();
  }
}

class _QueryData extends State<QueryData> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFunctions function = FirebaseFunctions.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  bool selected = false;
  bool loadData = false;
  TextEditingController _queryString = TextEditingController();
  late Future<dynamic> queryResult;
  Future<dynamic> fetchData() async {
    if (loadData == true) {
      final response =
          await CustomFunctions.getData(function, auth, db, _queryString.text);

      if (response != null) {
        return response;
      } else {
        return response;
      }
    } else {
      DoNothingAction();
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   queryResult = fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return const Text("The user is not authenticated properly.");
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              pageName: "Query Data",
            )),
        endDrawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SideBarWidget(),
              Expanded(
                child: LayoutBuilder(
                  builder: ((context, constraints) {
                    return Column(
                      children: [
                        const ThreePercentVertSizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Text(
                              "Query (BigQuery Syntax):",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        const OnePercentVertSizedBox(),
                        Container(
                          width: constraints.maxWidth -
                              MediaQuery.of(context).size.width * 0.04,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              style: GoogleFonts.courierPrime(),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _queryString,
                              decoration: const InputDecoration(
                                  hintText: "Input your query here.",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.indigo),
                                child: const Text(
                                  "RUN",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  loadData = true;
                                  setState(() {
                                    queryResult = fetchData();
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                          ],
                        ),
                        const ThreePercentVertSizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Text(
                              "Results:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        const OnePercentVertSizedBox(),
                        Container(
                          width: constraints.maxWidth -
                              MediaQuery.of(context).size.width * 0.04,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          child: FutureBuilder(
                            future: fetchData(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Column(
                                    children: [
                                      const ThreePercentVertSizedBox(),
                                      CircularProgress(
                                          color: Colors.indigo,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ],
                                  );
                                default:
                                  if (snapshot.hasError) {
                                    return const Center(
                                      child: Text("Error...",
                                          style:
                                              TextStyle(color: Colors.indigo)),
                                    );
                                  }
                              }
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: Text(
                                    "No Data...",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              } else {
                                print(snapshot.data);
                                if (snapshot.data.substring(0, 5) != 'Error') {
                                  print(snapshot.data);
                                  return DynamicDataTable(
                                      jsonDecode(snapshot.data));
                                } else {
                                  print(snapshot.data);
                                  return Text(
                                      'There was an error: ${snapshot.data}');
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
