import 'package:cgi_app/Login/user_class.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LogIn();
  }
}

final FirebaseFirestore db = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class _LogIn extends State<LogIn> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final userDoc = db.collection("user_mapping").doc("user_maps");
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final QuerySnapshot usersQuery =
        await FirebaseFirestore.instance.collection('user_mapping').get();
    final List<Map<String, dynamic>> users =
        usersQuery.docs.map((DocumentSnapshot doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();
    return users;
  }

  UserCustomerData? myData;
  String? getUserId() {
    final User? user = auth.currentUser;
    try {
      return user!.uid;
    } on Exception {
      return null;
    }
  }

  Future<List<String>> getCustomerIds() async {
    for (var customer in await fetchUsers()) {
      for (var map in customer['user_data']) {
        if (getUserId() == map['user_id']) {
          return map['customer_list'];
        } else {
          DoNothingAction();
        }
      }
    }
    throw [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(pageName: "Login")),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(
            child: Column(children: [
              const ThreePercentVertSizedBox(),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.6,
                  child: const Image(
                      image: AssetImage('assets/cgi_logo_no_bg.png'))),
              const ThreePercentVertSizedBox(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 78, 78, 78))),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.black),
                ),
              ),
              const OnePercentVertSizedBox(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 78, 78, 78))),
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.black),
                ),
              ),
              const OnePercentVertSizedBox(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    signInUsingEmailPassword(
                      email: controllerEmail.text,
                      password: controllerPassword.text,
                      context: context,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.indigo),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ]),
          ),
        ));
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Wrong Email or Password"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showError('Wrong password provided.');
      }
    }
    if (user != null) {
      showSuccess("Login Successful!");
      setState(() {});
      if (context.mounted) {
        // Navigator.pushNamed(context, '/Analytics/', arguments: getUserId()!);
        Navigator.pushNamed(context, '/Analytics');
      }
    } else {
      showError(
          'Check the username and password and try again!\nOr, contact our team for support.');
    }
    return null;
  }
}
