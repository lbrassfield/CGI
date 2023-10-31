import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';
import 'package:cgi_app/CustomerPages/BillingHistory/billing_history_tab.dart';

class BillingHistory extends StatelessWidget {
  final List monthList = ['Aug, 2023', 'Sep, 2023', 'Oct, 2023'];
  BillingHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              pageName: "Billing History",
            )),
        endDrawer: const MyDrawer(
          userFirstName: "Lindsey",
          userLastName: "Brassfield",
        ),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                    for (var month in monthList)
                      BillingHistoryTab(monthString: month)
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                )
              ],
            ),
          ),
        ));
  }
}
