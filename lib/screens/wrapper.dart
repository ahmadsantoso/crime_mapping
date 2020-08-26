import 'package:crime_mapping/screens/login/login.dart';
import 'package:crime_mapping/screens/register/register.dart';
import 'package:crime_mapping/screens/dashboard/dashboard.dart';
import 'package:crime_mapping/screens/account/account.dart';
import 'package:crime_mapping/screens/report/report.dart';
import 'package:crime_mapping/screens/homepage/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    return MaterialApp(
      home: (firebaseUser == null) ? Login() : HomePage(firebaseUser),
      routes: {
        Login.routeName: (BuildContext context) => Login(),
        Register.routeName: (BuildContext context) => Register(),
        Dashboard.routeName: (BuildContext context) => Dashboard(),
        Account.routeName: (BuildContext context) => Account(),
        Report.routeName: (BuildContext context) => Report(),
        HomePage.routeName: (BuildContext context) => HomePage(firebaseUser),
      },
    );
  }
}
