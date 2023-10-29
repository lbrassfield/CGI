import 'package:cgi_app/AppBar/NavButtons/PageName.dart';
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
  @override
  Widget build(BuildContext context) {
    Future<bool> authenticatedUser() async {
      final User? user = auth.currentUser;
      if (user != null) {
        print("user is authenticated!");
        return true;
      } else {
        print("user is not authenticated!");
        return false;
      }
    }

    return MediaType(
      desktop: FutureBuilder(
          future: authenticatedUser(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return AppBar(
                iconTheme: const IconThemeData(color: Colors.indigo),
                backgroundColor: Colors.white,
                title: PageName(pageName: widget.pageName),
                automaticallyImplyLeading: false,
              );
            } else {
              return AppBar(
                backgroundColor: Colors.white,
                title: const HomeButton(),
                automaticallyImplyLeading: false,
                actions: const [
                  LearnMoreButton(),
                  ContactUsButton(),
                  LoginButton(),
                ],
              );
            }
          }),
      mobile: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 203, 59),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(children: [Container()]),
      ),
    );
  }
}
