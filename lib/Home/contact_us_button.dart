import 'package:flutter/material.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.05,
      // decoration: BoxDecoration(
      //   border:
      //       Border.all(width: 1.0, color: Colors.black),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.indigo),
          child: const Text(
            "CONTACT US",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/ContactUs',
            );
          },
        ),
      ),
    );
  }
}
