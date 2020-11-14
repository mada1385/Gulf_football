import 'package:flutter/material.dart';

Widget buildTable(List _table) {
  List<Widget> teams = [];
  for (var team in _table) {
    teams.add(
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  team['overall_league_position'].toString().length > 1
                      ? Text(team['overall_league_position'].toString() + ' - ')
                      : Text(" " +
                          team['overall_league_position'].toString() +
                          ' - '),
                  Row(
                    children: [
                      Image.network(
                        team['team_badge'],
                        height: 30,
                        width: 30,
                      ),
                      team['team_name'].toString().length > 11
                          ? Text(team['team_name'].toString().substring(0, 11) +
                              '...')
                          : Text(team['team_name'].toString()),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(team['overall_league_payed'].toString()),
                  Text(team['overall_league_W'].toString()),
                  Text(team['overall_league_D'].toString()),
                  Text(team['overall_league_L'].toString()),
                  Text(team['overall_league_GF'].toString()),
                  Text(team['overall_league_GA'].toString()),
                  Text(team['overall_league_GF'].toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  return Column(
    children: teams,
  );
}
