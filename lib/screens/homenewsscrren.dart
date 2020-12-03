import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/latestnewslist.dart';
import 'package:gulf_football/components/matchtile.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/components/trendlist.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/match.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:gulf_football/services/newsAPI.dart';
import 'package:gulf_football/services/trendAPI.dart';
import 'package:provider/provider.dart';

class Homenewsscreen extends StatefulWidget {
  @override
  _HomenewsscreenState createState() => _HomenewsscreenState();
}

class _HomenewsscreenState extends State<Homenewsscreen> {
  Timer _clockTimer;
  void islogged() {
    if (Provider.of<Userprovider>(context, listen: false).token != null) {
      Provider.of<Userprovider>(context, listen: false)
          .loadlivegamesdetailsDetails();
    }
  }

  void initState() {
    super.initState();
    Provider.of<Userprovider>(context, listen: false)
        .loadlivegamesdetailsDetails();
    _clockTimer = Timer.periodic(Duration(seconds: 20), (_) => islogged());
  }

  void dispose() {
    _clockTimer.cancel();
    super.dispose();
    // _userController.close();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: Scaffold(
        body: Theme(
          data: ThemeData(accentColor: accentcolor),
          child: ListView(
            children: [
              Container(
                // height: SizeConfig.safeBlockVertical * 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Boldaccectcolor(
                    //         text: "اهم الاخبار",
                    //       )
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 1,
                    ),
                    FutureBuilder(
                      future: TrendAPI().getAlltrends(),
                      builder: (context, snapshots) {
                        //the future builder is very intersting to use when you work with api
                        if (snapshots.hasData) {
                          Provider.of<Userprovider>(context, listen: false)
                              .setallnews(snapshots.data);
                          print((snapshots.data).length);
                          return Trendlist(
                            news: snapshots.data,
                            ishomescreen: true,
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

                    StreamBuilder(
                      stream: Provider.of<Userprovider>(context)
                          .livegamesuserController
                          .stream,
                      //Here we will call our getData() method,
                      builder: (context, snapshot) {
                        //the future builder is very intersting to use when you work with api
                        if (snapshot.hasData) {
                          if (snapshot.data["success"] == true) {
                            List<dynamic> matchesList = snapshot.data["result"];
                            print("Api service: ${snapshot.data}"); // to debug
                            List<SoccerMatch> matches = matchesList
                                .map((dynamic item) =>
                                    SoccerMatch.fromJson(item))
                                .toList();
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Boldaccectcolor(
                                        text: "مبارياتك المباشرة",
                                      ),
                                    ],
                                  ),
                                ),
                                Livematchesscoreboard(
                                  livematches: matches,
                                ),
                              ],
                            );
                          } else {
                            return Container(
                              height: 1,
                            );
                          }
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
                      }, // here we will buil the app layout
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
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
                          Provider.of<Userprovider>(context, listen: false)
                              .setallnews(snapshots.data);
                          print((snapshots.data).length);
                          return Latestnewslist(
                            news: snapshots.data,
                            ishomescreen: true,
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
        ),
      ),
    );
  }
}

class Livematchesscoreboard extends StatelessWidget {
  const Livematchesscoreboard({
    Key key,
    this.livematches,
  }) : super(key: key);
  final List<SoccerMatch> livematches;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          enableInfiniteScroll: false,
          scrollDirection: Axis.horizontal,
          height: 170,
          autoPlay: true),
      items: livematches.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity, child: matchTile(i, context)),
            );
          },
        );
      }).toList(),
    );
  }
}
