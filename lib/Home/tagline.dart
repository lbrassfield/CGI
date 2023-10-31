import 'package:flutter/material.dart';

class Tagline extends StatelessWidget {
  const Tagline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.1,
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1.0, color: Colors.black),
      // ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Text(
          "Add the Power of Analytics to\nyour Growing Business Today",
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
          softWrap: true,
        ),
      ),
    );
  }
}
