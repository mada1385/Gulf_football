import 'package:flutter/material.dart';
import 'package:gulf_football/components/standingslist.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';

class Standinglist extends StatefulWidget {
  final List data;

  const Standinglist({Key key, this.data}) : super(key: key);
  @override
  _StandinglistState createState() => _StandinglistState();
}

class _StandinglistState extends State<Standinglist> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: SizeConfig.blockSizeVertical * 72,
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12, blurRadius: 15.0, offset: Offset(0.0, .75))
        ], color: Colors.white),
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Pos',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Club',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PL',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'W',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'D',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'L',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Gf',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'GA',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Pts',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildTable(widget.data),
          ],
        ),
      ),
    );
  }
}
