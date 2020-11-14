import 'package:flutter/cupertino.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/match.dart';

class Statsscreen extends StatelessWidget {
  final SoccerMatch match;

  const Statsscreen({Key key, this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Statrow(match: match, index: index);
              },
              itemCount: match.stats.stats.length,
            ),
          ),
        ),
      ],
    );
  }
}

class Statrow extends StatelessWidget {
  const Statrow({Key key, @required this.match, @required this.index})
      : super(key: key);

  final SoccerMatch match;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          match.stats.stats[index]["home"],
          style: TextStyle(
              color: accentcolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          match.stats.stats[index]["type"],
          style: TextStyle(
            color: textcolor,
            fontSize: 20,
          ),
        ),
        Text(
          match.stats.stats[index]["away"],
          style: TextStyle(
              color: textcolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
