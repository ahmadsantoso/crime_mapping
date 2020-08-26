import 'package:crime_mapping/component/profile_heading.dart';
import 'package:crime_mapping/component/profile_list.dart';
import 'package:crime_mapping/shared/font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crime_mapping/services/auth.dart';
import 'package:crime_mapping/screens/login/login.dart';

class Account extends StatefulWidget {
  static final routeName = '/Account';

  @override
  State<StatefulWidget> createState() {
    return _AccountState();
  }
}

class _AccountState extends State<Account> {
  String noHandphone = '081976589944';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //background
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 350.0),
          color: Colors.white,
          child: ProfileList(
            icon1: Icons.supervisor_account,
            text1: 'Renakta',
            icon2: Icons.payment,
            text2: '0076564322312',
            icon3: Icons.local_phone,
            text3: '$noHandphone',
            icon4: Icons.reply,
            text4: 'Sign Out',
          ),
        ),
        //heading
        Container(
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueAccent,
        ),
        //profileheading
        ProfileHeading(
          image: AssetImage('assets/1.jpg'),
          nama: 'Rudi Widodo Suharyanto',
          email: 'rudiws990@gmail.com',
        ),
      ],
    ));
  }
}
