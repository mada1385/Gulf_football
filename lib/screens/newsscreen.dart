import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/latestnewslist.dart';
import 'package:gulf_football/components/newscard.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/components/trendlist.dart';
import 'package:gulf_football/components/trendnewscard.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/news.dart';
import 'package:gulf_football/screens/newsdetails.dart';
import 'package:gulf_football/services/newsAPI.dart';
import 'package:gulf_football/services/trendAPI.dart';

class Newsscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: NewsAPI().getAllnews(),
          builder: (context, snapshots) {
            //the future builder is very intersting to use when you work with api
            if (snapshots.hasData) {
              print((snapshots.data).length);
              return Newslist(news: snapshots.data);
            } else {
              return Center(
                  child: Theme(
                data: Theme.of(context).copyWith(accentColor: accentcolor),
                child: new CircularProgressIndicator(
                  backgroundColor: Colors.black26,
                ),
              ));
            }
          },
        ),
      ),
    );
  }
}

class Newslist extends StatelessWidget {
  const Newslist({
    Key key,
    @required this.news,
  }) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Boldaccectcolor(
                      text: "اهم الاخبار ",
                    )
                  ],
                ),
              ),
              FutureBuilder(
                future: TrendAPI().getAlltrends(),
                builder: (context, snapshots) {
                  //the future builder is very intersting to use when you work with api
                  if (snapshots.hasData) {
                    print((snapshots.data).length);
                    return Trendlist(news: snapshots.data);
                  } else {
                    return Center(
                        child: Theme(
                      data:
                          Theme.of(context).copyWith(accentColor: accentcolor),
                      child: new CircularProgressIndicator(
                        backgroundColor: Colors.black26,
                      ),
                    ));
                  }
                },
              ), // here we will buil  =>

              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Boldaccectcolor(
                      text: "اخر الاخبار",
                    ),
                  ],
                ),
              ),
              Latestnewslist(news: news),
            ],
          ),
        ),
      ],
    );
  }
}
