import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gulf_football/components/latestnewslist.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/models/news.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:share/share.dart';

class Newsdetails extends StatelessWidget {
  final News news;
  final List<News> relatednews;
  share(BuildContext context, String link) {
    final RenderBox box = context.findRenderObject();

    Share.share("${news.title}",
        subject: "${news.title}",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  List<News> firstfive() {
    List<News> first = List<News>();
    for (var i in relatednews) {
      if (i != null) {
        if (i.title != news.title) {
          first.add(i);
        }
      }
    }
    return first;
  }

  Newsdetails({Key key, this.news, this.relatednews}) : super(key: key);
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 30),
                          child: Tittletext(
                            data: news.title,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // CircleAvatar(
                          //   backgroundColor: Colors.grey,
                          //   radius: 20,
                          //   backgroundImage: AssetImage(
                          //     "asset/nopic.jpg",
                          //   ),
                          // ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      news.tag,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      news.time,
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: IconButton(
                              onPressed: () {
                                share(context, "link");
                              },
                              icon: Icon(FontAwesomeIcons.share),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [

                    //   ],
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Hero(
                tag: "hero",
                child: Image(
                  image: new NetworkImageWithRetry(
                    news.image,
                  ),
                  fit: BoxFit.fill,
                  height: 250,
                ),
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
              Latestnewslist(news: firstfive(), ishomescreen: true)
            ],
          ),
        ),
      ),
    );
  }
}
