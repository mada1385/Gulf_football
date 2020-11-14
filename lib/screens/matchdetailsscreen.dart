import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/matchtile.dart';
import 'package:gulf_football/components/teamcard.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/match.dart';
import 'package:gulf_football/screens/lineupscreen.dart';
import 'package:gulf_football/screens/statsscreen.dart';

class MatchDetailsScreen extends StatefulWidget {
  final SoccerMatch match;

  const MatchDetailsScreen({Key key, this.match}) : super(key: key);
  @override
  _MatchDetailsScreenState createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  int tapindex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> detailscreen = [
      Statsscreen(
        match: widget.match,
      ),
      Lineupscreen(
        match: widget.match,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 1.0))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              height: SizeConfig.blockSizeVertical * 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: SizedBox(
                    height: 20,
                  )),
                  Text(
                    widget.match.fixture.status.league,
                    style: TextStyle(fontSize: 15, color: textcolor),
                  ),
                  Flexible(
                      child: SizedBox(
                    height: 20,
                  )),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Teamcard(
                          logourl: widget.match.home.logoUrl,
                          teamname: widget.match.home.name,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${widget.match.goal.home} : ${widget.match.goal.away}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            fontSize: SizeConfig.blockSizeVertical * 5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Teamcard(
                          logourl: widget.match.away.logoUrl,
                          teamname: widget.match.away.name,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                      child: SizedBox(
                    height: 20,
                  )),
                  Text(
                    widget.match.fixture.status.status,
                    style: TextStyle(fontSize: 20, color: textcolor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            tapindex = 0;
                          });
                        },
                        child: Text(
                          "الاحصائيات",
                          style: TextStyle(color: textcolor, fontSize: 20),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            tapindex = 1;
                          });
                        },
                        child: Text(
                          "التشكيل",
                          style: TextStyle(color: textcolor, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Card(elevation: 20, child: detailscreen[tapindex]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
