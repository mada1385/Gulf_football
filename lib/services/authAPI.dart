import 'package:flutter/cupertino.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/user.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Authapi {
  Future register(User x) async {
    try {
      final signup =
          await post("http://gulf-goal.herokuapp.com/api/users/signup", body: {
        "password": x.password,
        "email": x.email,
        "username": x.username
      });
      var body = jsonDecode(signup.body);
      if (signup != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("token", body["token"]);
        return jsonDecode(signup.body);
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future login(User x) async {
    try {
      final signup =
          await post("http://gulf-goal.herokuapp.com/api/users/login", body: {
        "password": x.password,
        "email": x.email,
      });
      var body = jsonDecode(signup.body);
      if (body["success"]) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("token", body["token"]);
        return jsonDecode(signup.body);
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", null);
    print(preferences.get("token"));
    Provider.of<Userprovider>(context, listen: false).settoken(null);
  }
}
