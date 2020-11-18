import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/latestnewslist.dart';
import 'package:gulf_football/components/newscard.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/models/news.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:gulf_football/services/newsAPI.dart';

class Newsdetails extends StatelessWidget {
  final news;

  Newsdetails({Key key, this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 40),
                          child: Contenttext(
                            data: news.title,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 20),
                          child: Contenttext(
                            data: news.tag,
                            size: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Image.network(
                news.image,
                fit: BoxFit.fill,
                height: 250,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Contenttext(data: news.content, size: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Boldaccectcolor(
                  text: "أخبار ذات صلة",
                ),
              ),
              FutureBuilder(
                future: NewsAPI().getAllnews(),
                builder: (context, snapshots) {
                  //the future builder is very intersting to use when you work with api
                  if (snapshots.hasData) {
                    print((snapshots.data).length);
                    return Latestnewslist(
                      news: snapshots.data,
                      ishomescreen: true,
                    );
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
