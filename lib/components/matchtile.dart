import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/match.dart';
import 'package:gulf_football/screens/matchdetailsscreen.dart';

Widget matchTile(SoccerMatch match, BuildContext context) {
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  var status = match.fixture.status.status;

  if (homeGoal == null) homeGoal = "0";
  if (awayGoal == null) awayGoal = "0";

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Card(
      elevation: 20,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MatchDetailsScreen(
                        match: match,
                      )));
        },
        child: Container(
          // height: SizeConfig.blockSizeVertical * 7,
          margin: EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Text(
                match.fixture.status.league,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      match.home.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Image(
                      image: new NetworkImageWithRetry(
                        match.home.logoUrl,
                      ),
                      width: 36.0,
                      fit: BoxFit.cover),
                  Expanded(
                    child: Text(
                      "${homeGoal} - ${awayGoal}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        fontSize: SizeConfig.blockSizeVertical * 4,
                      ),
                    ),
                  ),
                  Image(
                      image: new NetworkImageWithRetry(
                        match.away.logoUrl,
                      ),
                      width: 36.0,
                      fit: BoxFit.cover),
                  Expanded(
                    child: Text(
                      match.away.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: SizeConfig.blockSizeVertical * 2,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
