import 'package:flutter/material.dart';
import 'package:gulf_football/components/newscard.dart';
import 'package:gulf_football/models/news.dart';
import 'package:gulf_football/screens/newsdetails.dart';

class Latestnewslist extends StatelessWidget {
  const Latestnewslist({
    Key key,
    @required this.news,
  }) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: news.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Newsdetails(
                              news: i,
                            )));
              },
              child: Newscard(
                news: i,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
