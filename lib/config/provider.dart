import 'package:flutter/material.dart';
import 'package:gulf_football/models/teams.dart';

class Userprovider extends ChangeNotifier {
  String token;
  List<Teams> favteams = List<Teams>();
  Map<int, Teams> x = Map();

  void settoken(String usertoken) {
    token = usertoken;
    notifyListeners();
  }

  void addfav(Teams favteam) {
    favteams.add(favteam);
    notifyListeners();
    print(favteams.toString());
  }

  void deletefav(Teams favteam) {
    favteams.removeAt(favteams.indexOf(favteam));
    notifyListeners();
    print(favteams.toString());
  }
}
