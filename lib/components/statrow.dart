import 'package:flutter/material.dart';
import 'package:gulf_football/config/colors.dart';

class Statrow extends StatelessWidget {
  const Statrow({
    Key key,
    @required this.match,
  }) : super(key: key);

  final dynamic match;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          match["home"],
          style: TextStyle(
              color: accentcolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          match["type"],
          style: TextStyle(
            color: textcolor,
            fontSize: 20,
          ),
        ),
        Text(
          match["away"],
          style: TextStyle(
              color: textcolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
