import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/match.dart';
import 'package:gulf_football/models/teams.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class FavouriteAPI {
  Future postfavourite(List<Teams> x, String token) async {
    for (var item in x) {
      try {
        final favouriteteam = await post(
            "http://gulf-goal.herokuapp.com/api/teams/add-teams-to-favorites",
            body: {
              "team_name": item.teamname,
              "team_badge": item.teambadge,
              "team_key": item.id,
            },
            headers: {
              "Authorization": "bearer $token"
            });
        var body = jsonDecode(favouriteteam.body);
        print(body);
      } catch (e) {
        print(e);
        return e;
      }
    }
  }

  Future deletefavourite(String token, String id) async {
    try {
      final favouriteteam = await post(
          "http://gulf-goal.herokuapp.com/api/teams/remove-team-to-favorites",
          headers: {
            // 'Content-Type': 'application/json',
            // 'Accept': 'application/json',
            "Authorization": "bearer $token",
          },
          body: {
            "teamId": id
          });
      var body;
      print("Api service: ${favouriteteam.body}");
      body = jsonDecode(favouriteteam.body);
      if (body["success"]) {
        print("success");
        return body;
      } else {
        print("success");
        return body;
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<List<Teams>> getfavourite(String token) async {
    try {
      final favouriteteam = await get(
          "http://gulf-goal.herokuapp.com/api/teams/all-favorites",
          headers: {
            // 'Content-Type': 'application/json',
            // 'Accept': 'application/json',
            "Authorization": "bearer $token",
          });
      var body;
      print("Api service: ${favouriteteam.body}");

      if (favouriteteam.statusCode == 200) {
        // this mean that we are connected to the data base
        body = jsonDecode(favouriteteam.body);
        if (favouriteteam.body.length > 1) {
          List<dynamic> newsdata = body;
          print("newsdata service: $newsdata"); // to debug
          List<Teams> news =
              newsdata.map((dynamic item) => Teams.fromJson(item)).toList();
          return news;
        } else {
          return null;
        }
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<List<SoccerMatch>> getFavLiveMatches(String token) async {
    try {
      Response res = await get(
          "http://gulf-goal.herokuapp.com/api/teams/following-live-matches",
          headers: {
            "Authorization": "bearer ${token}",
            "Content-Type": "application/json",
            "Accept": "application/json"
          });
      print("live match stayusvode ${res.statusCode}");
      var body = jsonDecode(res.body);
      print(res.body);
      if (res.statusCode == 200) {
        if (res.body.length >= 1) {
          List<dynamic> matchesList = body["result"];
          print("Api service: ${body}"); // to debug
          List<SoccerMatch> matches = matchesList
              .map((dynamic item) => SoccerMatch.fromJson(item))
              .toList();
          return matches;
        } else {
          print("failed");
          return [];
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
