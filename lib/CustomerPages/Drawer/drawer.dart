import 'dart:async';

import 'package:cgi_app/CustomerPages/Drawer/logout_list_tile.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/CustomerPages/Drawer/list_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
        }
      }
    }
    throw DoNothingAction();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.3,
      backgroundColor: Colors.indigo,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Signed in as:",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const ThreePercentVertSizedBox(),
                FutureBuilder(
                  future: fetchUsers(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Column(
                          children: [
                            FivePercentVertSizedBox(),
                            CircularProgress(
                                color: Colors.white, height: 10, width: 10),
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
                      return Text(
                        "${snapshot.data!['first_name']} ${snapshot.data!['last_name']}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          MyListTile(
              navigationPage: "/Analytics",
              icon: Icons.analytics_rounded,
              title: "Analytics"),
          MyListTile(
              navigationPage: "/ApplicationSettings",
              icon: Icons.settings_rounded,
              title: "Application Settings"),
          MyListTile(
              navigationPage: "/DataIngestionHistory",
              icon: Icons.cloud_sync_rounded,
              title: "Data Ingestion History"),
          MyListTile(
              navigationPage: "/BillingHistory",
              icon: Icons.credit_card_rounded,
              title: "Billing History"),
          const MyLogOutListTile(
              navigationPage: "/", icon: Icons.logout_rounded, title: "Logout"),
        ],
      ),
    );
  }
}
