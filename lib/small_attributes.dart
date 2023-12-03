import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class MediaType extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const MediaType({Key? key, required this.mobile, required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 500) {
      return mobile;
    } else {
      return desktop;
    }
  }
}

class GradientBackgroundContainer extends StatelessWidget {
  final SingleChildScrollView pageData;

  const GradientBackgroundContainer({Key? key, required this.pageData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: const BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.75, 0.98],
            // Add one stop for each color. Stops should increase from 0 to 1
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.white,
              Colors.indigoAccent,
            ],
          ),
        ),
        child: pageData);
  }
}

class ThreePercentVertSizedBox extends StatelessWidget {
  const ThreePercentVertSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
    );
  }
}

class FivePercentVertSizedBox extends StatelessWidget {
  const FivePercentVertSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }
}

class OnePercentVertSizedBox extends StatelessWidget {
  const OnePercentVertSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }
}

class CircularProgress extends StatelessWidget {
  final double? height;
  final Color color;

  const CircularProgress(
      {required this.height, required this.color, super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: height,
          height: height,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color))),
    );
  }
}

class CustomFunctions {
  static Future<String> getDbAccessSecret(
      FirebaseAuth auth, FirebaseFirestore db) async {
    final QuerySnapshot usersQuery = await db.collection('user_mapping').get();
    final List<Map<String, dynamic>> users =
        usersQuery.docs.map((DocumentSnapshot doc) {
      if (doc.data() == true) {}
      return doc.data() as Map<String, dynamic>;
    }).toList();
    for (var userObject in users) {
      for (var userMap in userObject.values) {
        for (var user in userMap) {
          if (user['user_id'] == auth.currentUser!.uid) {
            return 'MLFIN_DB';
          }
        }
      }
    }
    throw DoNothingAction();
  }

  static Future<dynamic> getServiceCreds(FirebaseFunctions function,
      FirebaseAuth auth, FirebaseFirestore db) async {
    try {
      var args = await getDbAccessSecret(auth, db);
      final response =
          await function.httpsCallable('get_service_acct').call(args);
      final data = response
          .data; // This will contain the JSON response from your Firebase Function
      return data;
    } catch (e) {
      return 'Error calling Firebase Function: $e';
    }
  }

  static Future<dynamic> getData(FirebaseFunctions function, FirebaseAuth auth,
      FirebaseFirestore db, String queryString) async {
    var secretArg = await getDbAccessSecret(auth, db);
    var queryArg = queryString;
    var args = {
      "args": {"secret_name": secretArg, "query_string": queryArg}
    };
    try {
      final response =
          await function.httpsCallable('query_big_query').call(args);
      final data = response.data;
      return data;
    } catch (e) {
      // return 'Error calling Firebase Function: $e';
      return e;
    }
  }
}
