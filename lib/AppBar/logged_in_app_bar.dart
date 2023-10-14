import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/AppBar/logo_button.dart';

class LoggedInAppBar extends StatelessWidget {
  final String pageName;
  const LoggedInAppBar({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaType(
        desktop: AppBar(
          iconTheme: const IconThemeData(color: Colors.indigo),
          backgroundColor: Colors.white,
          title: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                pageName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontSize: 24),
              )),
          automaticallyImplyLeading: false,
        ),
        mobile: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.indigo,
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Row(children: [LogoButton()]),
        ));
  }
}
