import 'package:flutter/material.dart';

class HistoryTab extends StatefulWidget {
  final String monthString;
  const HistoryTab({Key? key, required this.monthString}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HistoryTab();
  }
}

class _HistoryTab extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.indigo,
        backgroundColor: Colors.indigo,
        iconColor: Colors.white,
        textColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text(
          widget.monthString,
          style: const TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        children: [
          Form(
            child: Column(
              children: [
                Row(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: const FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Detailed Billing Information, including history, \nexpected payments, Credit Card information, \nBank Account information, can be accessed \nat our payment partner, Stripe.",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            softWrap: true,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
