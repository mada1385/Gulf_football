import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gulf_football/components/fixturelist.dart';
import 'package:gulf_football/components/leaguefixturelist.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/match.dart';
import 'package:gulf_football/screens/standingsscreen.dart';
import 'package:gulf_football/services/footballapi.dart';
import 'package:gulf_football/services/standingsAPI.dart';
import 'package:intl/intl.dart';

class Leaguesfixturescreen extends StatefulWidget {
  final String leaugeidtab;
  final String selecteddate;

  const Leaguesfixturescreen({Key key, this.leaugeidtab, this.selecteddate})
      : super(key: key);
  @override
  _LeaguesfixturescreenState createState() => _LeaguesfixturescreenState();
}

class _LeaguesfixturescreenState extends State<Leaguesfixturescreen> {
  int leaguetab = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> leaugedetails = [
      Leaguefixturelist(
          leagueid: widget.leaugeidtab, selecteddate: widget.selecteddate),
      Standingscreen(leagueid: widget.leaugeidtab),
    ];
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 1),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Color(0xffFCFCFC),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    leaguetab = 0;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "المباريات",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: leaguetab == 0
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: leaguetab == 0
                                          ? Colors.green
                                          : Colors.transparent,
                                      height: 4,
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 4,
                            child: Container(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    leaguetab = 1;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "جدول الترتيب",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: leaguetab == 1
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: leaguetab == 1
                                          ? Colors.green
                                          : Colors.transparent,
                                      height: 4,
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Standingscreen(),

              // TeamList(idLeague),
            ),
            leaugedetails[leaguetab],
          ],
        ),
      ),
    );
  }
}
