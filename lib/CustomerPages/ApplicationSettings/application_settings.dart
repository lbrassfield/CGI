import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:cgi_app/CustomerPages/ApplicationSettings/general_settings.dart';
import 'package:cgi_app/CustomerPages/ApplicationSettings/billing_settings.dart';
import 'package:cgi_app/CustomerPages/ApplicationSettings/ingestion_settings.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';

class ApplicationSettings extends StatefulWidget {
  const ApplicationSettings({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ApplicationSettings();
  }
}

class _ApplicationSettings extends State<ApplicationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              pageName: "Application Settings",
            )),
        endDrawer: const MyDrawer(),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                    const GeneralSettings(),
                    const BillingSettings(),
                    const IngestionSettings(),
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
