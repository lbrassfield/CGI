import 'dart:async';

import 'package:cgi_app/AppBar/NavButtons/page_name.dart';
import 'package:cgi_app/AppBar/NavButtons/contact_us_button.dart';
import 'package:cgi_app/AppBar/NavButtons/home_button.dart';
import 'package:cgi_app/AppBar/NavButtons/learn_more_button.dart';
import 'package:cgi_app/AppBar/NavButtons/login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';

class MyAppBar extends StatefulWidget {
  final String pageName;
  const MyAppBar({Key? key, required this.pageName}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _MyAppBarState extends State<MyAppBar> {
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

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return MediaType(
        desktop: AppBar(
          backgroundColor: Colors.white,
          title: const HomeButton(),
          automaticallyImplyLeading: false,
          actions: const [
            LearnMoreButton(),
            ContactUsButton(),
            LoginButton(),
          ],
        ),
        mobile: AppBar(
          backgroundColor: Colors.white,
          title: const HomeButton(),
          automaticallyImplyLeading: false,
          actions: const [
            LearnMoreButton(),
            ContactUsButton(),
            LoginButton(),
          ],
        ),
      );
    } else {
      return MediaType(
        desktop: AppBar(
          iconTheme: const IconThemeData(color: Colors.indigo),
          backgroundColor: Colors.white,
          title: PageName(pageName: widget.pageName),
          automaticallyImplyLeading: false,
        ),
        mobile: AppBar(
          iconTheme: const IconThemeData(color: Colors.indigo),
          backgroundColor: Colors.white,
          title: PageName(pageName: widget.pageName),
          automaticallyImplyLeading: false,
        ),
      );
    }
  }
}
