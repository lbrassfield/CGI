import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  MyListTile(
      {Key? key,
      required this.navigationPage,
      required this.icon,
      required this.title})
      : super(key: key);

  final String navigationPage;
  final IconData icon;
  final String title;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      onTap: () {
        Navigator.pushNamed(context, navigationPage);
      },
    );
  }
}
