import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';

class Dashboard extends StatefulWidget {
  static final routeName = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(-6.130754, 106.856512), zoom: 10)),
      ],
    ));
  }
}
