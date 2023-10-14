// ignore_for_file: sized_box_for_whitespace

import 'package:cgi_app/CustomerPages/ApplicationSettings/form_field.dart';
import 'package:flutter/material.dart';

class BillingSettings extends StatefulWidget {
  const BillingSettings({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BillingSettings();
  }
}

class _BillingSettings extends State<BillingSettings> {
  final _formKey = GlobalKey<FormState>();
  final controllerBusinessName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.indigo,
        backgroundColor: Colors.indigo,
        iconColor: Colors.white,
        textColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text(
          "Billing Settings",
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        children: [
          Form(
            child: Column(children: [
              Row(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyFormField(
                        dataValue: controllerBusinessName,
                        hintText: "Business Name"),
                    MyFormField(
                        dataValue: controllerBusinessName,
                        hintText: "Street Address"),
                    MyFormField(
                        dataValue: controllerBusinessName,
                        hintText: "Apt, Suite, etc."),
                    MyFormField(
                        dataValue: controllerBusinessName, hintText: "City"),
                    MyFormField(
                        dataValue: controllerBusinessName, hintText: "State"),
                    MyFormField(
                        dataValue: controllerBusinessName,
                        hintText: "Zip Code"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Detailed Billing Information, including history, \nexpected payments, Credit Card information, \nBank Account information, can be accessed \nat our payment partner, Stripe.",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          softWrap: true,
                        ),
                      ),
                    )
                  ],
                )
              ]),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Request')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white),
                  child: const Text(
                    'SAVE CHANGES',
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
