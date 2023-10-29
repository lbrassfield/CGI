import 'package:flutter/material.dart';

class ChannelJunctionTab extends StatelessWidget {
  final String customerString;
  const ChannelJunctionTab({Key? key, required this.customerString})
      : super(key: key);
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
          customerString,
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
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Analytics/',
                            arguments: customerString);
                      },
                      child: Text(customerString))
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
