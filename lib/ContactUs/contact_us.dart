import 'package:flutter/material.dart';
import 'package:cgi_app/AppBar/app_bar.dart';
import 'package:cgi_app/ContactUs/first_name.dart';
import 'package:cgi_app/ContactUs/company.dart';
import 'package:cgi_app/ContactUs/email.dart';
import 'package:cgi_app/ContactUs/last_name.dart';
import 'package:cgi_app/ContactUs/message.dart';
import 'package:cgi_app/ContactUs/phone_number.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ContactUs();
  }
}

class _ContactUs extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerCompanyName = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60), child: MyAppBar()),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(children: [
                const Text("Contact Us",
                    style: TextStyle(color: Colors.indigo, fontSize: 40)),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                FirstName(firstName: controllerFirstName),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                LastName(lastName: controllerLastName),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                Email(email: controllerEmail),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                Company(company: controllerCompanyName),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                PhoneNumber(phoneNumber: controllerPhoneNumber),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                Message(message: controllerMessage),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Processing Request')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.indigo),
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
