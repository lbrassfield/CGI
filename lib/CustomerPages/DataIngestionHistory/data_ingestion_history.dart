import 'package:cgi_app/AppBar/logged_in_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';
import 'package:cgi_app/CustomerPages/DataIngestionHistory/data_ingestion_history_tab.dart';

class DataIngestionHistory extends StatefulWidget {
  final List monthList = ['Aug, 2023', 'Sep, 2023', 'Oct, 2023'];
  final String customerId;
  DataIngestionHistory(this.customerId, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DataIngestionHistory();
  }
}

class _DataIngestionHistory extends State<DataIngestionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: LoggedInAppBar(
              pageName: "Data Ingestion History",
            )),
        endDrawer: const MyDrawer(companyName: "ABC Corp."),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                    for (var month in widget.monthList)
                      HistoryTab(monthString: month)
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
