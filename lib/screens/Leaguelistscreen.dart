import 'package:flutter/material.dart';
import 'package:gulf_football/components/leaguelist.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/Leagues.dart';
import 'package:gulf_football/services/leagueAPI.dart';

class Leaguelistscreen extends StatefulWidget {
  final String countryid;

  const Leaguelistscreen({Key key, this.countryid}) : super(key: key);

  @override
  _LeaguelistscreenState createState() => _LeaguelistscreenState();
}

class _LeaguelistscreenState extends State<Leaguelistscreen> {
  TextEditingController controller = new TextEditingController();
  List<Leagues> onSearchTextChanged(String text, List<Leagues> fav) {
    List<Leagues> _searchResult = [];
    _searchResult.clear();
    if (text.isEmpty) {
      // setState(() {});
      return null;
    }

    fav.forEach((userDetail) {
      if (userDetail.leauge.toUpperCase().contains(text.toUpperCase()) ||
          userDetail.leauge.toUpperCase().contains(text.toUpperCase()))
        _searchResult.add(userDetail);
    });

    // setState(() {});
    return _searchResult;
  }

  bool searchstate = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox.expand(
          child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: searchstate == false
                    ? SizeConfig.blockSizeVertical * 0
                    : SizeConfig.blockSizeVertical * 10,
                color: Color(0xffF2FBF9),
                child: searchstate == false
                    ? null
                    : new Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.blockSizeVertical * 1),
                        child: new Card(
                          child: new ListTile(
                            leading: Icon(Icons.search,
                                size: SizeConfig.blockSizeVertical * 3),
                            title: new TextField(
                              controller: controller,
                              decoration: new InputDecoration(
                                  hintText: 'بحث', border: InputBorder.none),
                            ),
                            // trailing: new IconButton(
                            //   icon: new Icon(
                            //     Icons.cancel,
                            //     size: searchstate == false ? 0 : 25,
                            //   ),
                            //   onPressed: () {
                            //     controller.clear();
                            //   },
                            // ),
                          ),
                        ),
                      ),
              ),
              Container(
                width: double.infinity,
                height: SizeConfig.blockSizeVertical * 25,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.blockSizeVertical * 2.5,
                              top: SizeConfig.blockSizeVertical * 2.5),
                          child: Boldaccectcolor(
                            text: "اخنر الدوري المفضل ",
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeVertical * 2.5,
                                top: SizeConfig.blockSizeVertical * 2.5),
                            child: IconButton(
                              icon: Icon(
                                searchstate == false
                                    ? Icons.search
                                    : Icons.close,
                                size: SizeConfig.blockSizeVertical * 4,
                              ),
                              onPressed: () {
                                setState(() {
                                  searchstate = !searchstate;
                                  controller.clear();
                                });
                              },
                              color: accentcolor,
                              iconSize: SizeConfig.blockSizeVertical * 4,
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Contenttext(
                            data: "select your favourite league",
                            size: SizeConfig.blockSizeVertical * 2.5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 0.75)),
                  ],
                  color: Color(0xffF2FBF9),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: LeagueAPI().getAllCountries(
                    widget.countryid), //Here we will call our getData() method,
                builder: (context, snapshot) {
                  //the future builder is very intersting to use when you work with api
                  if (snapshot.hasData) {
                    if (onSearchTextChanged(controller.text, snapshot.data) ==
                        null)
                      return Leaguelist(
                        leagues: snapshot.data,
                      );
                    else
                      return Leaguelist(
                        leagues:
                            onSearchTextChanged(controller.text, snapshot.data),
                      );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }, // here we will buil the app layout
              ),
            ],
          ),
        ),
      )),
    );
  }
}
