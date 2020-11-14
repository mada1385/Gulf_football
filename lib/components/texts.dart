import 'package:flutter/material.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';

class Boldaccectcolor extends StatelessWidget {
  final String text;

  const Boldaccectcolor({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      text,
      style: TextStyle(
          color: accentcolor,
          fontSize: SizeConfig.blockSizeVertical * 3,
          fontWeight: FontWeight.bold),
    );
  }
}

class Contenttext extends StatelessWidget {
  final String data;
  final double size;

  const Contenttext({Key key, @required this.data, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          color: textcolor, fontSize: size, fontWeight: FontWeight.normal),
    );
  }
}
