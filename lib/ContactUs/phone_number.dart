import 'package:flutter/material.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({Key? key, required this.phoneNumber}) : super(key: key);
  final TextEditingController phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: TextFormField(
        controller: phoneNumber,
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
            hintText: "Phone Number",
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.black),
      ),
    );
  }
}
