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
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/news.dart';
import 'package:gulf_football/models/tags.dart';
import 'package:gulf_football/screens/newsdetails.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:gulf_football/services/newsAPI.dart';
import 'package:gulf_football/services/tagsAPI.dart';
import 'package:gulf_football/services/trendAPI.dart';
import 'package:provider/provider.dart';

class Newsscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: //the future builder is very intersting to use when you work with api
            Newslist(),
      ),
    );
  }
}

class Newslist extends StatefulWidget {
  @override
  _NewslistState createState() => _NewslistState();
}

class _NewslistState extends State<Newslist> {
  List<Tags> generatelsit(dynamic data) {
    List<Tags> filtertags = [Tags("all tags", "all tags")];
    for (var item in data) {
      filtertags.add(item);
    }
    return filtertags;
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: ListView(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Boldaccectcolor(
                        text: "اهم الاخبار ",
                      ),
                      FutureBuilder(
                        future: Tagsapi().getAlltags(),
                        builder: (context, snapshots) {
                          //the future builder is very intersting to use when you work with api
                          if (snapshots.hasData) {
                            List<Tags> tags = generatelsit(snapshots.data);
                            return DropdownButton(
                                items: tags.map((i) {
                                  return DropdownMenuItem(
                                    value: i.tag,
                                    child: Text(
                                      i.tag,
                                    ),
                                  );
                                }).toList(),
                                value: Provider.of<Userprovider>(context)
                                    .initvaluetrends,
                                onChanged: (val) {
                                  setState(() {
                                    Provider.of<Userprovider>(context,
                                            listen: false)
                                        .setinitvaluetrends(val);
                                    print(Provider.of<Userprovider>(context)
                                        .initvaluetrends);
                                  });
                                });
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
                ), // here we will buil  =>

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Boldaccectcolor(
                        text: "اخر الاخبار",
                      ),
                      FutureBuilder(
                        future: Tagsapi().getAlltags(),
                        builder: (context, snapshots) {
                          //the future builder is very intersting to use when you work with api
                          if (snapshots.hasData) {
                            List<Tags> tags = generatelsit(snapshots.data);
                            return DropdownButton(
                                items: tags.map((i) {
                                  return DropdownMenuItem(
                                    value: i.tag,
                                    child: Text(
                                      i.tag,
                                    ),
                                  );
                                }).toList(),
                                value: Provider.of<Userprovider>(context)
                                    .initvaluenews,
                                onChanged: (val) {
                                  setState(() {
                                    Provider.of<Userprovider>(context,
                                            listen: false)
                                        .setinitvaluenews(val);
                                    print(Provider.of<Userprovider>(context)
                                        .initvaluetrends);
                                  });
                                });
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
                FutureBuilder(
                  future: NewsAPI().getAllnews(),
                  builder: (context, snapshots) {
                    //the future builder is very intersting to use when you work with api
                    if (snapshots.hasData) {
                      print((snapshots.data).length);
                      return Latestnewslist(
                        news: snapshots.data,
                        ishomescreen: false,
                      );
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
    );
  }
}
