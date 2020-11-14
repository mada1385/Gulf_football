import 'dart:convert';
import 'package:gulf_football/models/news.dart';
import 'package:http/http.dart';

class TrendAPI {
  Future<List<News>> getAlltrends() async {
    try {
      Response res =
          await get("http://gulf-goal.herokuapp.com/api/news/all-trends");
      print(res.statusCode);
      var body;
      print("Api service: ${res.body}");

      if (res.statusCode == 200) {
        // this mean that we are connected to the data base
        body = jsonDecode(res.body);
        if (res.body.length > 1) {
          List<dynamic> newsdata = body;
          print("newsdata service: $newsdata"); // to debug
          List<News> news =
              newsdata.map((dynamic item) => News.fromJson(item)).toList();
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
