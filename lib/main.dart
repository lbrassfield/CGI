// ignore_for_file: sized_box_for_whitespace
import 'dart:async';
import 'package:cgi_app/AppBar/NavButtons/contact_us_button.dart';
import 'package:cgi_app/AppBar/NavButtons/learn_more_button.dart';
import 'package:cgi_app/CustomerPages/Drawer/drawer.dart';
import 'package:cgi_app/Home/opening_statement.dart';
import 'package:cgi_app/Home/tagline.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:flutter/material.dart';
import 'AppBar/app_bar.dart';
import 'package:cgi_app/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:googleapis/bigquery/v2.dart' as bigquery;
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;

final GoogleSignIn _googleSignIn =
    GoogleSignIn(scopes: <String>[bigquery.BigqueryApi.bigqueryScope]);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
        print('user is logged in!');
      } else {
        print('user not logged in!');
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact() async {
    String contactText = '';
    setState(() {
      contactText = 'Loading contact info...';
    });

    // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();

    assert(client != null, 'Authenticated client missing!');

    // Prepare a Bigquery Service authenticated client.
    final bigquery.BigqueryApi bigqueryApi = bigquery.BigqueryApi(client!);
    // Retrieve a list of the datasets
    final bigquery.DatasetList response =
        await bigqueryApi.datasets.list('cascadia-growth-insights');
    print(response);
  }

  // late StreamSubscription<User?> user;
  // void initState() {
  //   super.initState();
  //   user = FirebaseAuth.instance.authStateChanges().listen((user) {
  //     if (user == null) {
  //       // print("User is currently signed out!");
  //     } else {
  //       // print("User is currently signed in!");
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppBar(pageName: "Home")),
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
                const Column(
                  children: [
                    Tagline(),
                    FivePercentVertSizedBox(),
                    OpeningStatement(),
                    FivePercentVertSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            LearnMoreButton(),
                          ],
                        ),
                        Column(
                          children: [
                            ContactUsButton(),
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
      endDrawer: const MyDrawer(),
    );
  }
}
