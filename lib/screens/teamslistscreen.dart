import 'package:flutter/material.dart';
import 'package:gulf_football/components/teamslist.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/teams.dart';
import 'package:gulf_football/services/teamsAPI.dart';

class Teamslistscreen extends StatefulWidget {
  final String leagueid;

  const Teamslistscreen({Key key, this.leagueid}) : super(key: key);

  @override
  _TeamslistscreenState createState() => _TeamslistscreenState();
}

class _TeamslistscreenState extends State<Teamslistscreen> {
  TextEditingController controller = new TextEditingController();
  List<Teams> onSearchTextChanged(String text, List<Teams> fav) {
    List<Teams> _searchResult = [];
    _searchResult.clear();
    if (text.isEmpty) {
      // setState(() {});
      return null;
    }

    fav.forEach((userDetail) {
      if (userDetail.teamname.toUpperCase().contains(text.toUpperCase()) ||
          userDetail.teamname.toUpperCase().contains(text.toUpperCase()))
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
                            text: "اختر فريقك المفضل",
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
                            data: "select your favourite team",
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
                future: TeamsAPI().getAllteams(
                    widget.leagueid), //Here we will call our getData() method,
                builder: (context, snapshot) {
                  //the future builder is very intersting to use when you work with api
                  if (snapshot.hasData) {
                    if (onSearchTextChanged(controller.text, snapshot.data) ==
                        null)
                      return Teamslist(
                        teams: snapshot.data,
                      );
                    else
                      return Teamslist(
                        teams:
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
