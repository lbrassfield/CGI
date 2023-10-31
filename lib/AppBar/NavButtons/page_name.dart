import 'package:flutter/material.dart';

class PageName extends StatelessWidget {
  final String pageName;
  const PageName({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        pageName,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 24),
      ),
    );
  }
}
