import 'package:flutter/material.dart';
import 'package:gulf_football/config/colors.dart';

class Teamcard extends StatelessWidget {
  final String teamname, logourl;
  const Teamcard({
    this.teamname,
    this.logourl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          logourl,
          width: 50.0,
        ),
        Text(
          teamname,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
