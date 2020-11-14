import 'package:flutter/material.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/models/Leagues.dart';
import 'package:gulf_football/screens/teamslistscreen.dart';

class Leaguelist extends StatelessWidget {
  final List<Leagues> leagues;

  const Leaguelist({
    Key key,
    @required this.leagues,
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
              child: GestureDetector(
                onTap: () {
                  print("***************************${leagues[index].id}");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Teamslistscreen(
                                leagueid: leagues[index].id,
                              )));
                },
                child: ListTile(
                  // leading: Image.network(countries[index].url),
                  title: Contenttext(
                    data: leagues[index].leauge,
                    size: 25,
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            ),
          );
        },
        itemCount: leagues.length,
      ),
    );
  }
}
