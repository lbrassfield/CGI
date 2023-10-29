import 'package:flutter/material.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: Colors.indigo),
        child: const Text(
          "REQUEST A DEMO",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/ContactUs',
          );
        },
      ),
    );
  }
}
