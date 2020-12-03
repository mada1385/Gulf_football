import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gulf_football/components/fixturelist.dart';
import 'package:gulf_football/components/signinchecker.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/match.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Favouritematchesscreen extends StatefulWidget {
  @override
  _FavouritematchesscreenState createState() => _FavouritematchesscreenState();
}

class _FavouritematchesscreenState extends State<Favouritematchesscreen> {
  Timer _clockTimer;
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  void isstrem() {
    setState(() {
      if (formatter.format(
              Provider.of<Userprovider>(context, listen: false).selectedDate) ==
          formatter.format(
              Provider.of<Userprovider>(context, listen: false).currentdate)) {
        Provider.of<Userprovider>(context, listen: false)
            .loadfavgamesdetailsDetails();
      }
    });
  }

  @override
  void initState() {
    Provider.of<Userprovider>(context, listen: false)
        .loadfavgamesdetailsDetails();
    _clockTimer = Timer.periodic(Duration(seconds: 20), (_) => isstrem());
    super.initState();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _userController.close();
    _clockTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<Userprovider>(context).token == null
        ? Expanded(child: Center(child: Signinchecher()))
        : StreamBuilder(
            stream: Provider.of<Userprovider>(context)
                .favgamesuserController
                .stream,
            //Here we will call our getData() method,
            builder: (context, snapshot) {
              //the future builder is very intersting to use when you work with api
              if (snapshot.hasData) {
                if (snapshot.data["success"] == true) {
                  List<dynamic> matchesList = snapshot.data["result"];
                  print("Api service: ${snapshot.data}"); // to debug
                  List<SoccerMatch> matches = matchesList
                      .map((dynamic item) => SoccerMatch.fromJson(item))
                      .toList();
                  return Fixturelist(
                    allmatches: matches,
                  );
                } else {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لا يوجد مباريات اليوم",
                          style: TextStyle(
                              fontFamily: 'cairo',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: accentcolor),
                        ),
                      ],
                    ),
                  );
                }
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
