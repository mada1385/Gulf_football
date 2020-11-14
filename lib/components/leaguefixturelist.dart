import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/services/footballapi.dart';
import 'package:intl/intl.dart';

import 'fixturelist.dart';

class Leaguefixturelist extends StatefulWidget {
  final String selecteddate;
  final String leagueid;

  Leaguefixturelist({Key key, this.selecteddate, this.leagueid})
      : super(key: key);

  @override
  _LeaguefixturelistState createState() => _LeaguefixturelistState();
}

class _LeaguefixturelistState extends State<Leaguefixturelist> {
  Timer _clockTimer;
  StreamController _userController;
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  loadDetails() async {
    SoccerApi()
        .getAllMatches(widget.leagueid, widget.selecteddate)
        .then((res) async {
      print('LoadDetails of ${res.length}');
      _userController.add(res);
      return res;
    });
  }

  void initState() {
    _userController = new StreamController();
    loadDetails();
    setState(() {
      _clockTimer = Timer.periodic(Duration(seconds: 10), (_) => loadDetails());
    });
    super.initState();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userController.close();
    _clockTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _userController.stream, //Here we will call our getData() method,
      builder: (context, snapshot) {
        //the future builder is very intersting to use when you work with api
        if (snapshot.hasData) {
          print(snapshot.data.length);
          return Fixturelist(
            allmatches: snapshot.data,
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
