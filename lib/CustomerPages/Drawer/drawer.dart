import 'package:cgi_app/CustomerPages/Drawer/logout_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/CustomerPages/Drawer/list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, required this.companyName}) : super(key: key);

  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.3,
      backgroundColor: Colors.indigo,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              companyName,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          const MyListTile(
              navigationPage: "/Analytics",
              icon: Icons.analytics_rounded,
              title: "Analytics"),
          const MyListTile(
              navigationPage: "/CustomerSettings",
              icon: Icons.settings_rounded,
              title: "Application Settings"),
          const MyListTile(
              navigationPage: "/DataIngestionHistory",
              icon: Icons.cloud_sync_rounded,
              title: "Data Ingestion History"),
          const MyListTile(
              navigationPage: "/BillingHistory",
              icon: Icons.credit_card_rounded,
              title: "Billing History"),
          const MyLogOutListTile(
              navigationPage: "/", icon: Icons.logout_rounded, title: "Logout"),
        ],
      ),
    );
  }
}
