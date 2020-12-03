import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/statrow.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/models/match.dart';

import 'nointernetscreen.dart';

class Statsscreen extends StatelessWidget {
  final SoccerMatch match;

  const Statsscreen({Key key, this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: Expanded(
        child: Container(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: match.goals.goals.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: i["home_scorer"] == ""
                                    ? []
                                    : [
                                        Flexible(
                                          child: Text(
                                            i["home_scorer"],
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontFamily: 'cairo',
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Icon(Icons.sports_soccer),
                                      ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Expanded(
                              flex: 1,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    border: Border.all(color: accentcolor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        i["time"],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: 'cairo',
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: i["away_scorer"] == ""
                                    ? []
                                    : [
                                        Icon(Icons.sports_soccer),
                                        Flexible(
                                          child: Text(
                                            i["away_scorer"],
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: 'cairo',
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: match.cards.cards.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: i["home_fault"] == ""
                                    ? []
                                    : [
                                        Flexible(
                                          child: Text(
                                            i["home_fault"],
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontFamily: 'cairo',
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          height: 22,
                                          width: 18,
                                          color: i["card"] == "yellow card"
                                              ? Colors.yellow
                                              : Colors.red,
                                        ),
                                      ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Expanded(
                              flex: 1,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    border: Border.all(color: accentcolor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        i["time"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'cairo',
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: i["away_fault"] == ""
                                    ? []
                                    : [
                                        Container(
                                          height: 22,
                                          width: 18,
                                          color: i["card"] == "yellow card"
                                              ? Colors.yellow
                                              : Colors.red,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: Text(
                                            i["away_fault"],
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: 'cairo',
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: match.stats.stats.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Statrow(match: i);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
