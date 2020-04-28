import 'package:flutter/material.dart';
import 'package:gardenfth/Services/Auth.dart';
import 'package:gardenfth/UI/auth/landing_page.dart';
import 'package:gardenfth/UI/auth/main_signin_page.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    accentColor: Colors.white,
    primarySwatch: Colors.red,
  ),
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/':(context) => landingPage(auth: Auth(),),
  },
));