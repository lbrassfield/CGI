import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyLogOutListTile extends StatelessWidget {
  const MyLogOutListTile(
      {Key? key,
      required this.navigationPage,
      required this.icon,
      required this.title})
      : super(key: key);

  final String navigationPage;
  final IconData icon;
  final String title;

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
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushNamed(context, navigationPage);
      },
    );
  }
}
