import 'package:flutter/material.dart';
import 'package:cgi_app/Login/login.dart';
import 'package:cgi_app/ContactUs/contact_us.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/LogIn':
        return MaterialPageRoute(
            builder: (_) => const LogIn(), settings: settings);
      case '/ContactUs':
        return MaterialPageRoute(
            builder: (_) => const ContactUs(), settings: settings);
    }
    throw MaterialPageRoute(builder: (_) => const LogIn(), settings: settings);
  }
}
