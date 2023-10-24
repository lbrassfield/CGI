import 'package:cgi_app/CustomerPages/analytics.dart';
import 'package:cgi_app/CustomerPages/BillingHistory/billing_history.dart';
import 'package:cgi_app/CustomerPages/DataIngestionHistory/data_ingestion_history.dart';
import 'package:cgi_app/Login/channel_junction.dart';
import 'package:cgi_app/Process/our_process.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/Login/login.dart';
import 'package:cgi_app/ContactUs/contact_us.dart';
import 'package:cgi_app/CustomerPages/ApplicationSettings/application_settings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
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
      case '/CustomerSettings/':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => ApplicationSettings(args), settings: settings);
        }
      case '/Analytics/':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => Analytics(args), settings: settings);
        }
      case '/BillingHistory/':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => BillingHistory(args), settings: settings);
        }
      case '/DataIngestionHistory/':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => DataIngestionHistory(args), settings: settings);
        }
      case '/ChannelJunction/':
        return MaterialPageRoute(
            builder: (BuildContext context) {
              final args = settings.arguments as ChannelJunctionArgs;
              return ChannelJunction(args.userId, args.customerList);
            },
            settings: settings);
    }
    throw MaterialPageRoute(builder: (_) => const LogIn(), settings: settings);
  }
}
