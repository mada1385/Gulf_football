import 'package:flutter/material.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/match.dart';
import 'package:gulf_football/components/matchtile.dart';

class Fixturelist extends StatefulWidget {
  final List<SoccerMatch> allmatches;

  const Fixturelist({Key key, this.allmatches}) : super(key: key);

  @override
  _FixturelistState createState() => _FixturelistState();
}

class _FixturelistState extends State<Fixturelist> {
  int matchindex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        // decoration: BoxDecoration(
        //   color: Color(0xFF4373D9),
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(40.0),
        //     topRight: Radius.circular(40.0),
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: widget.allmatches.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          matchindex = index;
                        });
                      },
                      child: matchTile(widget.allmatches[index], context));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
