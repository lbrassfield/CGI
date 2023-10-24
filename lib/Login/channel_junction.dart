import 'package:cgi_app/AppBar/logged_in_app_bar.dart';
import 'package:cgi_app/Login/channel_junction_tab.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';

class ChannelJunction extends StatefulWidget {
  final String userId;
  final List customerList;
  const ChannelJunction(this.userId, this.customerList, {Key? key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ChannelJunction();
  }
}

class _ChannelJunction extends State<ChannelJunction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: LoggedInAppBar(
              pageName: "Choose Your Application",
            )),
        endDrawer: const MyDrawer(companyName: "ABC Corp."),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                for (var customer in widget.customerList)
                  ChannelJunctionTab(customerString: customer),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                )
              ],
            ),
          ),
        ));
  }
}
