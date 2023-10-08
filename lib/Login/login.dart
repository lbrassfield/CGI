import 'package:flutter/material.dart';
import 'package:cgi_app/AppBar/app_bar.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LogIn();
  }
}

class _LogIn extends State<LogIn> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60), child: MyAppBar()),
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.6,
                  child: const Image(
                      image: AssetImage('assets/cgi_logo_no_bg.png'))),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 78, 78, 78))),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.black),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 78, 78, 78))),
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.black),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.indigo),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
