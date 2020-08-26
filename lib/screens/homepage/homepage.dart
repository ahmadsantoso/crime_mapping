import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crime_mapping/services/auth.dart';
import 'package:crime_mapping/screens/dashboard/dashboard.dart';
import 'package:crime_mapping/screens/account/account.dart';
import 'package:crime_mapping/screens/report/report.dart';

class HomePage extends StatefulWidget {
  static final routeName = '/home';
  final FirebaseUser user;

  HomePage(this.user);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, Object>> _pages = [
    {
      'page': Dashboard(),
      'title': 'Map',
    },
    {
      'page': Report(),
      'title': 'Report',
    },
    {
      'page': Account(),
      'title': 'Account',
    },
  ];

  int _selectedPageIndex = 0;

  Future<void> _selectPage(int index) async {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.add),
            title: Text('Report'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
