import 'package:flutter/material.dart';

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: Colors.indigo),
        child: const Text(
          "LEARN MORE",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/OurProcess',
          );
        },
      ),
    );
  }
}
