import 'package:flutter/material.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/Leagues.dart';
import 'package:gulf_football/models/country.dart';
import 'package:gulf_football/models/teams.dart';
import 'package:gulf_football/screens/homescreen.dart';
import 'package:provider/provider.dart';

class Teamslist extends StatelessWidget {
  final List<Teams> teams;

  const Teamslist({
    Key key,
    @required this.teams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(0, .75))
              ]),
              child: ListTile(
                leading: Image.network(teams[index].teambadge),
                title: Contenttext(
                  data: teams[index].teamname,
                  size: 25,
                ),
                trailing: Customcheck(team: teams[index]),
              ),
            ),
          );
        },
        itemCount: teams.length,
      ),
    );
  }
}

class Customcheck extends StatefulWidget {
  final Teams team;

  const Customcheck({Key key, this.team}) : super(key: key);

  @override
  _CustomcheckState createState() => _CustomcheckState();
}

class _CustomcheckState extends State<Customcheck> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      activeColor: accentcolor,
      checkColor: Colors.white,
      onChanged: (val) {
        setState(() {
          value = val;
          if (val == true)
            Provider.of<Userprovider>(context, listen: false)
                .addfav(widget.team);
          else if (val == false) {
            Provider.of<Userprovider>(context, listen: false)
                .deletefav(widget.team);
          }
        });
      },
    );
  }
}
