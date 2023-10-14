import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/AppBar/logo_button.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return MediaType(
        desktop: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.indigo),
              child: const Text(
                "HOME",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/',
                );
              },
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.indigo),
                child: const Text(
                  "LEARN MORE",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/OurProcess',
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.indigo),
                child: const Text(
                  "REQUEST A DEMO",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/ContactUs',
                  );
                },
              ),
            ),
            Padding(
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
                )),
          ],
        ),
        mobile: AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 203, 59),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Row(children: [LogoButton()]),
        ));
  }
}
