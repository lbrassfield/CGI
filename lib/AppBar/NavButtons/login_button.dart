import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: IconButton(
        icon: const Icon(
          Icons.person,
          color: Colors.indigo,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/LogIn',
          );
        },
      ),
    );
  }
}
