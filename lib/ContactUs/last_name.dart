import 'package:flutter/material.dart';

class LastName extends StatelessWidget {
  const LastName({Key? key, required this.lastName}) : super(key: key);
  final TextEditingController lastName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: TextFormField(
        controller: lastName,
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
            hintText: "Last Name",
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.black),
      ),
    );
  }
}
