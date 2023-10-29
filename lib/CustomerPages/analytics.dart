import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';

class Analytics extends StatefulWidget {
  final String userId;
  const Analytics(this.userId, {Key? key}) : super(key: key);
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
            child: MyAppBar(
              pageName: "Analytics",
            )),
        endDrawer: const MyDrawer(
          userFirstName: "Lindsey",
          userLastName: "Brassfield",
        ),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(child: Container()),
        ));
  }
}
