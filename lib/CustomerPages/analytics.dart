import 'package:cgi_app/AppBar/logged_in_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';

class Analytics extends StatefulWidget {
  final String customerId;
  const Analytics(this.customerId, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Analytics();
  }
}

class _Analytics extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: LoggedInAppBar(
              pageName: "Analytics",
            )),
        endDrawer: const MyDrawer(companyName: "ABC Corp."),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(child: Container()),
        ));
  }
}
