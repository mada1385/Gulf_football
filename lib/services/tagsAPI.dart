import 'dart:convert';

import 'package:gulf_football/models/tags.dart';
import 'package:http/http.dart';

class Tagsapi {
  Future<List<Tags>> getAlltags() async {
    try {
      Response res =
          await get("https://gulf-goal.herokuapp.com/api/tags/all-tags");
      print(res.statusCode);
      var body;
      print("Api service: ${res.body}");

      if (res.statusCode == 200) {
        // this mean that we are connected to the data base
        body = jsonDecode(res.body);
        if (res.body.length > 1) {
          List<dynamic> newsdata = body["tags"];
          print("newsdata service: $newsdata"); // to debug
          List<Tags> news =
              newsdata.map((dynamic item) => Tags.fromJson(item)).toList();
          return news;
        } else {
          return null;
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
