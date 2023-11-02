import 'dart:async';
import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:googleapis/bigquery/v2.dart' as bigquery;
// import 'package:googleapis_auth/googleapis_auth.dart' as api_auth
// show AuthClient;

final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[bigquery.BigqueryApi.bigqueryScope],
    clientId:
        '266830134123-s1okc7u156qabeig5to445ohg9h6cmgo.apps.googleusercontent.com');

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
  // late StreamSubscription<User?> user;
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        // _handleGetDatasets();
        print('user is logged in!');
        print(_currentUser);
      } else {
        print('user not logged in!');
      }
    });
    _googleSignIn.signInSilently();
  }

  // Future<void> _handleGetDatasets() async {
  //   String contactText = '';
  //   setState(() {
  //     contactText = 'Loading contact info...';
  //   });

  //   // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
  //   final api_auth.AuthClient? client =
  //       await _googleSignIn.authenticatedClient();

  //   assert(client != null, 'Authenticated client missing!');

  //   // Prepare a Bigquery Service authenticated client.
  //   final bigquery.BigqueryApi bigqueryApi = bigquery.BigqueryApi(client!);
  //   // Retrieve a list of the datasets
  //   final bigquery.DatasetList response =
  //       await bigqueryApi.datasets.list('cascadia-growth-insights');
  //   print("Here is the bigquery Response: ${response}");
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   user = auth.authStateChanges().listen((user) {
  //     if (user == null) {
  //       // print("User is not authenticated.");
  //     } else {
  //       // print("User authenticated.");
  //     }
  //   });
  // }

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
    if (auth.currentUser == null) {
      return Container();
    } else {
      return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              pageName: "Analytics",
            )),
        endDrawer: const MyDrawer(),
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
                      CircularProgress(
                          color: Colors.indigo, height: 100, width: 100),
                    ],
                  );
                default:
                  if (snapshot.hasError) {
                    print(snapshot.toString());
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
                return Column();
                // throw DoNothingAction();
              }
            },
          )),
        ),
      );
    }
  }
}
