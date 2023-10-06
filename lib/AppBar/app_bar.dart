import 'package:flutter/material.dart';
import 'package:cgi_app/Home/about.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 203, 59),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Navigate to another page.
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const About(),
              ));
            },
            child: const Text('About'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: false);
  }
}
