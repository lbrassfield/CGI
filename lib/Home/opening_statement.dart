import 'package:flutter/material.dart';

class OpeningStatement extends StatelessWidget {
  const OpeningStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.30,
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1.0, color: Colors.black),
      // ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Text(
          "At CGI, we deliver value to growing businesses that are helping local economies. \nThis is where data meets innovation to shape a brighter future. \nOur mission is to unearth the hidden potential within data, providing our \ncustomers with the knowledge to make informed decisions that drive success. \nSome of our core features include: \n \u2022 Secure cloud data storage\n \u2022 Scheduled Reporting to be delivered to you at your convenience\n \u2022 Real-Time data ingegration\n \u2022 Self-Service analytics that can meet your reporting requirements",
          style: TextStyle(color: Colors.indigo, height: 1.5),
          softWrap: true,
        ),
      ),
    );
  }
}
