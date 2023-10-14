// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({Key? key, required this.dataValue, required this.hintText})
      : super(key: key);
  final TextEditingController dataValue;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hintText,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.05,
            child: TextFormField(
              controller: dataValue,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text.';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo)),
                  hintText: hintText,
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.indigo),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
        ],
      ),
    );
  }
}
