import 'package:cgi_app/small_attributes.dart';
import "package:flutter/material.dart";

class LogoButton extends StatelessWidget {
  const LogoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaType(
      desktop: IconButton(
        iconSize: 200,
        icon: Image.asset(
          'assets/cgi_db_logo_no_bg.png',
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/',
          );
        },
      ),
      mobile: IconButton(
        iconSize: MediaQuery.of(context).size.height * 0.20,
        icon: Image.asset(
          'assets/cgi_logo_no_bg.png',
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/',
          );
        },
      ),
    );
  }
}
