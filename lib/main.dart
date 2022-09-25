import 'package:fashion_app/core/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/pages/login/login.dart';

void main() async{
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  // await 
  // HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  //TODO: if user ain't a user create a page to download sellet app

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Container(
                  child: Center(
                    child: Text(
                        "Something Went Wrong!... Could not initialize connection."),
                  ),
                ),
              ));
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            // builder: DevicePreview.appBuilder,
            title: 'Fashion App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: Login(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}