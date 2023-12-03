import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';

class BillingHistory extends StatelessWidget {
  BillingHistory({Key? key}) : super(key: key);

  final List monthList = ['Aug, 2023', 'Sep, 2023', 'Oct, 2023'];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppBar(
            pageName: "Billing History",
          )),
      endDrawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
