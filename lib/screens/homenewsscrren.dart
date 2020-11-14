import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
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
import 'package:gulf_football/screens/newsscreen.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:gulf_football/services/newsAPI.dart';
import 'package:gulf_football/services/trendAPI.dart';

class Homenewsscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<News> news = [
      News(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          "https://placeimg.com/640/480/any")
    ];

    SizeConfig().init(context);
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Boldaccectcolor(
                            text: "اهم الاخبار",
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
                            data: Theme.of(context)
                                .copyWith(accentColor: accentcolor),
                            child: new CircularProgressIndicator(
                              backgroundColor: Colors.black26,
                            ),
                          ));
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Boldaccectcolor(
                            text: "مبارياتك المفضلة",
                          ),
                        ],
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          height: 150,
                          autoPlay: true),
                      items: news.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.black54,
                                        offset: Offset(0, .75),
                                      )
                                    ]),
                                width: double.infinity,
                                child: Text(i.title),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
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
                    FutureBuilder(
                      future: NewsAPI().getAllnews(),
                      builder: (context, snapshots) {
                        //the future builder is very intersting to use when you work with api
                        if (snapshots.hasData) {
                          print((snapshots.data).length);
                          return Latestnewslist(news: snapshots.data);
                        } else {
                          return Center(
                              child: Theme(
                            data: Theme.of(context)
                                .copyWith(accentColor: accentcolor),
                            child: new CircularProgressIndicator(
                              backgroundColor: Colors.black26,
                            ),
                          ));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
