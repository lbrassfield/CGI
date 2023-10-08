import 'package:flutter/material.dart';

class FirstName extends StatelessWidget {
  const FirstName({Key? key, required this.firstName}) : super(key: key);
  final TextEditingController firstName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: TextFormField(
        controller: firstName,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text.';
          }
          return null;
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 78, 78, 78))),
            hintText: "First Name",
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.black),
      ),
    );
  }
}
