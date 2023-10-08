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
      // theme: ThemeData(
      //   scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     focusedBorder: OutlineInputBorder(
      //       borderSide: BorderSide(
      //         color: Color.fromARGB(255, 255, 255, 255),
      //       ),
      //     ),
      //   ),
      // ),
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
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: const BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.75, 0.98],
            // Add one stop for each color. Stops should increase from 0 to 1
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.white,
              Colors.indigoAccent,
            ],
          ),
        ),
        child: SingleChildScrollView(
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
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.1,
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 1.0, color: Colors.black),
                      // ),
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Cascadia Growth Insights",
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
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.3,
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 1.0, color: Colors.black),
                      // ),
                      child: const Text(
                        "We deliver value to growing businesses that are helping to shape the future. This is where data meets innovation to shape a brighter future. Our mission is to unearth the hidden potential within your data, providing you with the knowledge to make informed decisions that drive success.",
                        style: TextStyle(color: Colors.indigo, fontSize: 24),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.5,
                      // decoration: BoxDecoration(
                      //   border: Border.all(width: 1.0, color: Colors.black),
                      // ),
                      child: Image.asset(
                        'assets/cgi_db_logo_no_bg.png',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
