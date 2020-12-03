import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'fixturelist.dart';

class Leaguefixturelist extends StatefulWidget {
  @override
  _LeaguefixturelistState createState() => _LeaguefixturelistState();
}

class _LeaguefixturelistState extends State<Leaguefixturelist> {
  Timer _clockTimer;
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  void isstrem() {
    setState(() {
      if (formatter.format(
              Provider.of<Userprovider>(context, listen: false).selectedDate) ==
          formatter.format(
              Provider.of<Userprovider>(context, listen: false).currentdate)) {
        Provider.of<Userprovider>(context, listen: false)
            .loadAllgamesdetailsDetails();
      }
    });
  }

  void initState() {
    // Provider.of<Userprovider>(context, listen: false)
    //     .loadAllgamesdetailsDetails();
    setState(() {
      _clockTimer = Timer.periodic(Duration(seconds: 20), (_) => isstrem());
    });
    super.initState();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _clockTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Userprovider>(context)
          .allgamesuserController
          .stream, //Here we will call our getData() method,
      builder: (context, snapshot) {
        //the future builder is very intersting to use when you work with api
        if (snapshot.hasData) {
          print(snapshot.data.length);
          return Fixturelist(
            allmatches: snapshot.data,
          );
        } else {
          return Expanded(
            child: Center(
                child: Theme(
              data: Theme.of(context).copyWith(accentColor: accentcolor),
              child: new CircularProgressIndicator(
                backgroundColor: Colors.black26,
              ),
            )),
          );
        }
      }, // here we will buil the app layout
    );
  }
}
