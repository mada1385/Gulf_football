import 'package:flutter/material.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/screens/signinscreen.dart';
import 'package:gulf_football/screens/signupscreen.dart';

class Signinchecher extends StatelessWidget {
  const Signinchecher({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Boldaccectcolor(
          text: "انت لست مسجل دخول",
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    color: Colors.black26,
                    offset: Offset(0, .75))
              ],
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: accentcolor),
          child: FlatButton(
            color: accentcolor,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Signinscreen()));
            },
            child: Text(
              "تسجيل دخول",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    color: Colors.black26,
                    offset: Offset(0, .75))
              ],
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white),
          child: FlatButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Signupscreen()));
            },
            child: Contenttext(
              data: "انشاء حساب",
              size: 25,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
