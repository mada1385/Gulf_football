import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gulf_football/models/teams.dart';
import 'package:gulf_football/services/favAPI.dart';
import 'package:gulf_football/services/footballapi.dart';
import 'package:intl/intl.dart';

class Userprovider extends ChangeNotifier {
  String initvaluenews = "all tags";
  String initvaluetrends = "all tags";
  String token, username;
  int leaugeindex = 0, gamescreenindex = 0;
  List<Teams> favteams = List<Teams>();
  bool issigningup = false;
  StreamController allgamesuserController;
  StreamController livegamesuserController;
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 0));
  DateTime currentdate = DateTime.now().subtract(Duration(days: 0));
  List<String> leagueid = [null, null, "148", "195", "262", "468"];
  List<Teams> sortfavteams;
  void getfav() async {
    sortfavteams = await FavouriteAPI().getfavourite(token);
  }

  void issign(bool x) {
    issigningup = x;
  }

  List<String> leaguestripe;
  List<String> notliveleague = [
    "كل المباريات",
    "★  المفضلة",
    "Premiere League",
    "Bundesliga",
    "Serie A",
    "La Liga"
  ];

  void islive() {
    if (formatter.format(selectedDate) == formatter.format(currentdate)) {
      leaguestripe = notliveleague;
      notifyListeners();
    } else {
      leaguestripe = notliveleague;
      notifyListeners();
    }
  }

  void setinitvaluenews(String userindex) {
    initvaluenews = userindex;
    notifyListeners();
  }

  void setleaugeindex(int userindex) {
    leaugeindex = userindex;
    notifyListeners();
  }

  void setinitvaluetrends(String userindex) {
    initvaluetrends = userindex;
    notifyListeners();
  }

  void setgamescreenindex(int userindex) {
    gamescreenindex = userindex;
    notifyListeners();
  }

  void setdate(DateTime userdate) {
    print(userdate);
    selectedDate = userdate;
    notifyListeners();
  }

  void settoken(String usertoken) {
    token = usertoken;
    notifyListeners();
  }

  void setusername(String usern) {
    username = usern;
    notifyListeners();
  }

  void addfav(Teams favteam) {
    favteams.add(favteam);
    notifyListeners();
    for (var team in favteams) {
      print(team.teamname);
    }
  }

  void deletefav(Teams favteam) {
    favteams.removeAt(favteams.indexOf(favteam));
    notifyListeners();
    for (var team in favteams) {
      print(team.teamname);
    }
  }

  loadAllgamesdetailsDetails() async {
    allgamesuserController = new StreamController();
    SoccerApi()
        .getAllMatches(leagueid[leaugeindex], formatter.format(selectedDate))
        .then((res) async {
      print('LoadDetails of ${res.length}');
      allgamesuserController.add(res);
      notifyListeners();
      return res;
    });
  }

  loadlivegamesdetailsDetails() async {
    livegamesuserController = new StreamController();
    FavouriteAPI().getFavLiveMatches(token).then((res) async {
      print("from provider $res");
      livegamesuserController.add(res);
      notifyListeners();
      return res;
    });
  }
}
