import 'package:flutter/material.dart';
import 'package:gulf_football/components/standinglist.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/services/standingsAPI.dart';

class Standingscreen extends StatelessWidget {
  const Standingscreen({
    Key key,
    @required this.leagueid,
  }) : super(key: key);

  final String leagueid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StandiingAPI(leagueid)
          .getTable(), //Here we will call our getData() method,
      builder: (context, snapshot) {
        //the future builder is very intersting to use when you work with api
        if (snapshot.hasData) {
          print((snapshot.data).length);
          return Standinglist(
            data: snapshot.data,
          );
        } else {
          return Center(
              child: Theme(
            data: Theme.of(context).copyWith(accentColor: accentcolor),
            child: new CircularProgressIndicator(
              backgroundColor: Colors.black26,
            ),
          ));
        }
      }, // here we will buil the app layout
    );
  }
}
