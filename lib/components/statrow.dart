import 'package:flutter/material.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Statrow extends StatelessWidget {
  const Statrow({
    Key key,
    @required this.match,
  }) : super(key: key);

  final dynamic match;

  double indicator() {
    double percent =
        int.parse(match["home"].replaceAll(RegExp('%'), '')).toDouble() /
            (int.parse(match["home"].replaceAll(RegExp('%'), '')).toDouble() +
                    int.parse(match["away"].replaceAll(RegExp('%'), '')))
                .toDouble();
    return percent;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          match["home"],
          style: TextStyle(
              fontFamily: 'cairo',
              color: accentcolor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Column(
          children: [
            Text(
              match["type"],
              style: TextStyle(
                fontFamily: 'cairo',
                color: textcolor,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: new LinearPercentIndicator(
                width: SizeConfig.blockSizeHorizontal * 55,
                animation: true,
                lineHeight: 10.0,
                animationDuration: 2500,
                percent: indicator(),
                isRTL: true,
                // center: Text("80.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: accentcolor,
              ),
            ),
          ],
        ),
        Text(
          match["away"],
          style: TextStyle(
              fontFamily: 'cairo',
              color: textcolor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
