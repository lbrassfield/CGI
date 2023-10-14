// ignore_for_file: sized_box_for_whitespace

import 'package:cgi_app/small_attributes.dart';
import 'package:flutter/material.dart';
import 'AppBar/app_bar.dart';
import 'package:cgi_app/route_generator.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CGI",
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      routes: <String, WidgetBuilder>{
        '/': (context) => const MyApp(),
      },
      theme: ThemeData(unselectedWidgetColor: Colors.white),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: MyAppBar()),
      body: GradientBackgroundContainer(
        pageData: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 1.0, color: Colors.black),
                      // ),
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Add the Power of Analytics to\nyour Growing Business Today",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.37,
                      height: MediaQuery.of(context).size.height * 0.30,
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 1.0, color: Colors.black),
                      // ),
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "At CGI, we deliver value to growing businesses that are helping local economies. \nThis is where data meets innovation to shape a brighter future. \nOur mission is to unearth the hidden potential within data, providing our \ncustomers with the knowledge to make informed decisions that drive success. \nSome of our core features include: \n \u2022 Secure cloud data storage\n \u2022 Scheduled Reporting to be delivered to you at your convenience\n \u2022 Real-Time data ingegration\n \u2022 Self-Service analytics that can meet your reporting requirements",
                          style: TextStyle(color: Colors.indigo, height: 1.5),
                          softWrap: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.05,
                              // decoration: BoxDecoration(
                              //   border:
                              //       Border.all(width: 1.0, color: Colors.black),
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
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
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.05,
                              // decoration: BoxDecoration(
                              //   border:
                              //       Border.all(width: 1.0, color: Colors.black),
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.indigo),
                                  child: const Text(
                                    "CONTACT US",
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
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.asset(
                        'assets/cgi_logo_no_bg.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
