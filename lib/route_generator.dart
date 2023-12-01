import 'package:cgi_app/CustomerPages/Analytics/analytics.dart';
import 'package:cgi_app/CustomerPages/BillingHistory/billing_history.dart';
import 'package:cgi_app/CustomerPages/DataIngestionHistory/data_ingestion_history.dart';
import 'package:cgi_app/Process/our_process.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/Login/login.dart';
import 'package:cgi_app/ContactUs/contact_us.dart';
import 'package:cgi_app/CustomerPages/ApplicationSettings/application_settings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/LogIn':
        return MaterialPageRoute(
            builder: (_) => const LogIn(), settings: settings);
      case '/ContactUs':
        return MaterialPageRoute(
            builder: (_) => const ContactUs(), settings: settings);
      case '/OurProcess':
        return MaterialPageRoute(
            builder: (_) => const OurProcess(), settings: settings);
      case '/ApplicationSettings':
        return MaterialPageRoute(
            builder: (_) => const ApplicationSettings(), settings: settings);
      case '/Analytics':
        return MaterialPageRoute(
            builder: (_) => const Analytics(), settings: settings);
      case '/BillingHistory':
        return MaterialPageRoute(
            builder: (_) => BillingHistory(), settings: settings);
      case '/DataIngestionHistory':
        return MaterialPageRoute(
            builder: (_) => DataIngestionHistory(), settings: settings);
    }
    throw MaterialPageRoute(builder: (_) => const LogIn(), settings: settings);
  }
}
