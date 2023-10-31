import 'package:flutter/material.dart';

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.all(4),
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
      ),
    );
  }
}
