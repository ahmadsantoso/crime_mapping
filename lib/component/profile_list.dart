import 'package:crime_mapping/screens/login/login.dart';
import 'package:crime_mapping/services/auth.dart';
import 'package:crime_mapping/shared/font.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileList extends StatelessWidget {
  final IconData icon1, icon2, icon3, icon4;
  final String text1, text2, text3, text4;

  ProfileList({
    this.icon1,
    this.icon2,
    this.icon3,
    this.icon4,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(
        right: 20.0,
        left: 20.0,
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //jeniskelamin
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
                child: Icon(
                  icon1,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20.0),
              Text(
                text1,
                style: blackText.copyWith(fontSize: 20.0),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          //
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
                child: Icon(
                  icon2,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 2 * 20.0 - 70.0,
                child: Text(
                  text2,
                  style: blackText.copyWith(fontSize: 20.0),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          //
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
                child: Icon(
                  icon3,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20.0),
              Text(
                text3,
                style: blackText.copyWith(fontSize: 20.0),
              )
            ],
          ),

          SizedBox(
            height: 10.0,
          ),
          //
          InkWell(
            onTap: () async {
              await AuthServices.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: Icon(
                    icon4,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  text4,
                  style: blackText.copyWith(fontSize: 20.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
