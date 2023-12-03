import 'package:cgi_app/CustomerPages/ApplicationSettings/form_field.dart';
import 'package:flutter/material.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _GeneralSettings();
  }
}

class _GeneralSettings extends State<GeneralSettings> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerCompanyName = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
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
        collapsedShape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: const Text(
          "General Settings",
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
                        hintText: "Primary Email"),
                    MyFormField(
                        dataValue: controllerBusinessName,
                        hintText: "Primary Phone Number"),
                    MyFormField(
                        dataValue: controllerBusinessName,
                        hintText: "Secondary Email"),
                    MyFormField(
                        dataValue: controllerBusinessName,
                        hintText: "Secondary Phone Number"),
                  ],
                ),
                Column(
                  children: [
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
