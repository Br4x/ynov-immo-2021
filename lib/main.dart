import 'package:flutter/material.dart';
import 'package:ynov_immo/constants.dart';
import 'package:ynov_immo/pages/Map/map-screen.dart';
import 'package:ynov_immo/pages/details/details-screen.dart';
import 'package:ynov_immo/pages/home/home-screen.dart';
import 'package:http/http.dart' as http;
import 'package:ynov_immo/pages/login/login-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ynov Immo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: ksecondaryColor),
          bodyText2: TextStyle(color: ksecondaryColor),
        ),
      ),
      //home: HomeScreen(),
      home: LoginScreen(),
    );
  }
}
