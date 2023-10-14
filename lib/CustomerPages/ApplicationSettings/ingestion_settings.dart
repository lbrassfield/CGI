import 'package:flutter/material.dart';

class IngestionSettings extends StatefulWidget {
  const IngestionSettings({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _IngestionSettings();
  }
}

class _IngestionSettings extends State<IngestionSettings> {
  final _formKey = GlobalKey<FormState>();
  int? _selectedValue;
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
          "Ingestion Settings (Listed by Ingestion Source)",
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: ExpansionTile(
                collapsedBackgroundColor: Colors.indigo,
                backgroundColor: Colors.indigo,
                iconColor: Colors.white,
                textColor: Colors.white,
                collapsedIconColor: Colors.white,
                title: const Text(
                  "Sales (Google Sheet)",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                children: [
                  Form(
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.02),
                        child: const Text(
                          "Ingestion Frequency",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Real-Time:",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Radio(
                            activeColor: Colors.white,
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                          const Text(
                            "Daily:",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Radio(
                            activeColor: Colors.white,
                            value: 2,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                          const Text(
                            "Weekly:",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Radio(
                            activeColor: Colors.white,
                            value: 3,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                          const Text(
                            "Monthly:",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Radio(
                            activeColor: Colors.white,
                            value: 4,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                backgroundColor: Colors.white),
                            child: const Text(
                              'SAVE CHANGES',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ]),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
