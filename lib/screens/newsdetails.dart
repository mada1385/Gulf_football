import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/latestnewslist.dart';
import 'package:gulf_football/components/newscard.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/models/news.dart';
import 'package:gulf_football/services/newsAPI.dart';

class Newsdetails extends StatelessWidget {
  final news;
  List<News> listofnews = [
    News(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "https://placeimg.com/640/480/any")
  ];

  Newsdetails({Key key, this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    child: Contenttext(
                      data: news.title,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Image.network(
              news.image,
              fit: BoxFit.fill,
              height: 200,
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
                text: "Related news",
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
                    data: Theme.of(context).copyWith(accentColor: accentcolor),
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
    );
  }
}
