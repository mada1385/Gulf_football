import 'package:flutter/material.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/models/country.dart';
import 'package:gulf_football/screens/Leaguelistscreen.dart';

class Countrylist extends StatelessWidget {
  Countrylist({
    Key key,
    @required this.countries,
  }) : super(key: key);

  final List<Country> countries;

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Leaguelistscreen(
                                countryid: countries[index].id,
                              )));
                },
                child: ListTile(
                  // leading: Image.network(countries[index].url),
                  title: Contenttext(
                    data: countries[index].country,
                    size: 25,
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            ),
          );
        },
        itemCount: countries.length,
      ),
    );
  }
}
