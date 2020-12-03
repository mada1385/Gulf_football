import 'package:flutter/material.dart';

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
            fontFamily: 'cairo',
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
