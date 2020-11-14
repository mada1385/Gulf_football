import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/profileoptioncard.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/screens/favouritesscreen.dart';
import 'package:gulf_football/screens/gamescreen.dart';
import 'package:gulf_football/screens/homenewsscrren.dart';
import 'package:gulf_football/screens/newsscreen.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:gulf_football/screens/profileoptions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  List widgetOptions = <Widget>[
    Homenewsscreen(),
    Gamescreen(),
    Newsscreen(),
    Favoutitesscreen(),
    Profileoptions()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void logincheck() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    String x = p.get("token");
    if (x != null) {
      Provider.of<Userprovider>(context, listen: false).settoken(x);
    } else {
      Provider.of<Userprovider>(context, listen: false).settoken(null);
    }
    print(Provider.of<Userprovider>(context, listen: false).token);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logincheck();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: accentcolor),
          selectedLabelStyle: TextStyle(color: accentcolor),
          unselectedItemColor: textcolor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home,
              ),
              title: Text('الرئيسية'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.sports_football),
              title: Text('المباريات'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.new_releases),
              title: Text('الاخبار'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.star),
              title: Text('المفضلة'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.person),
              title: Text('الحساب'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: accentcolor,
          onTap: _onItemTapped,
        ),
        body: widgetOptions[_selectedIndex],
      ),
    );
  }
}
