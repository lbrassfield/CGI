import 'dart:async';
import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Analytics();
  }
}

class _Analytics extends State<Analytics> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late StreamSubscription<User?> user;

  @override
  void initState() {
    super.initState();
    user = auth.authStateChanges().listen((user) {
      if (user == null) {
        // print("User is not authenticated.");
      } else {
        // print("User authenticated.");
      }
    });
  }

  Future<Map<String, dynamic>> fetchUsers() async {
    final QuerySnapshot usersQuery =
        await FirebaseFirestore.instance.collection('user_mapping').get();
    final List<Map<String, dynamic>> users =
        usersQuery.docs.map((DocumentSnapshot doc) {
      if (doc.data() == true) {}
      return doc.data() as Map<String, dynamic>;
    }).toList();
    for (var userObject in users) {
      for (var userMap in userObject.values) {
        for (var user in userMap) {
          if (user['user_id'] == auth.currentUser!.uid) return user;
          print(user['last_name']);
        }
      }
    }
    throw DoNothingAction();
  }

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return Container();
    } else {
      return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              pageName: "Analytics",
            )),
        endDrawer: MyDrawer(
          userFirstName: auth.currentUser!.uid,
          userLastName: auth.currentUser!.uid,
        ),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(
              child: FutureBuilder(
            future: fetchUsers(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Column(
                    children: [
                      FivePercentVertSizedBox(),
                      IndigoCircularProgress(height: 100, width: 100),
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
                print(snapshot.data!['first_name']);
                return Text(snapshot.data!['first_name']);
              }
            },
          )),
        ),
      );
    }
  }
}
