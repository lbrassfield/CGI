import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:cgi_app/CustomerPages/Sidebar/sidebar_v2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';
import 'package:cgi_app/CustomerPages/Analytics/data_table.dart';
import 'dart:convert';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Analytics();
  }
}

class _Analytics extends State<Analytics> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFunctions function = FirebaseFunctions.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return const Text("The user is not authenticated properly.");
    } else {
      return Scaffold(
        backgroundColor: Colors.white70,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              pageName: "Analytics",
            )),
        endDrawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Row(
            children: [
              const SideBarWidget(),
              Column(children: [
                FutureBuilder(
                  future: CustomFunctions.getData(function, auth, db, """
                    select
                        expense_dtm as Expense_Date,
                        voluntary_flg as Voluntary,
                        concat('\$',cast(round(sum(expense_amt),2) as string)) as Expense_Amount
                    from MLFIN.stg_expenses
                    group by expense_dtm, voluntary_flg
                    order by expense_dtm
                    limit 100
                    """),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Column(
                          children: [
                            FivePercentVertSizedBox(),
                            CircularProgress(color: Colors.indigo, height: 100),
                          ],
                        );
                      default:
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Error...",
                                style: TextStyle(color: Colors.indigo)),
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
                      return DynamicDataTable(jsonDecode(snapshot.data));
                      // return Text("Data Table Complete!");
                    }
                  },
                ),
              ]),
            ],
          ),
        ),
      );
    }
  }
}
