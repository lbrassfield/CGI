import 'package:cgi_app/AppBar/logged_in_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';
import 'package:cgi_app/Login/user_class.dart';

class Analytics extends StatefulWidget {
  // final String customerId;
  const Analytics(
      // this.customerId,
      {Key? key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Analytics();
  }
}

final FirebaseFirestore db = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class _Analytics extends State<Analytics> {
  final userDoc = db.collection("user_mapping").doc("user_maps");
  Future<UserCustomerData?> getFirestoreData() async {
    try {
      final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("customer_configs")
          .doc("mlfin")
          .get();
      print(docSnapshot.toString());
      if (docSnapshot.exists) {
        return UserCustomerData.fromFireStore(docSnapshot);
      } else {
        return UserCustomerData.fromFireStore(docSnapshot);
      }
    } catch (e) {
      print('docSnapshot does not exist. Error fetching Firestore data: $e');
      return null;
    }
  }

  UserCustomerData? myData;
  String? getUser() {
    final User? user = auth.currentUser;
    try {
      return user!.email;
    } on Exception {
      return null;
    }
  }

  // MyFirstoreData = UserCustomerData
  // User = UserData
  Future<void> fetchData() async {
    final data = await getFirestoreData();
    if (data != null) {
      setState(() {
        myData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: LoggedInAppBar(
              pageName: "Analytics",
            )),
        endDrawer: const MyDrawer(companyName: "ABC Corp."),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(
              child: Column(
            children: [
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("customer_configs")
                      .doc("mlfin")
                      .get()
                  //     .then((value) {
                  //   print(value.data());
                  // })
                  ,
                  builder: (context, snapshot) {
                    print(snapshot.toString());
                    if (snapshot.data == true) {
                      return Text(snapshot.data.toString());
                    } else {
                      return Text("No Data");
                    }
                  }),
              // for (var user in myData!.authenticatedUsers)
              //   ListTile(title: Text(user.email)),
              // Text("Hello World!")
            ],
          )),
        ));
  }
}
