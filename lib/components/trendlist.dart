import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/trendnewscard.dart';
import 'package:gulf_football/models/news.dart';
import 'package:gulf_football/screens/newsdetails.dart';

class Trendlist extends StatelessWidget {
  const Trendlist({
    Key key,
    @required this.news,
  }) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(),
        items: news.map((i) {
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
                child: TrendNewscard(
                  news: i,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
