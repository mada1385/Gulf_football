import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/favlist.dart';
import 'package:gulf_football/components/signinchecker.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/teams.dart';
import 'package:gulf_football/screens/countrylistscreen.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:gulf_football/services/favAPI.dart';
import 'package:provider/provider.dart';

class Favoutitesscreen extends StatefulWidget {
  @override
  _FavoutitesscreenState createState() => new _FavoutitesscreenState();
}

class _FavoutitesscreenState extends State<Favoutitesscreen> {
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
          userDetail.teambadge.toUpperCase().contains(text.toUpperCase()))
        _searchResult.add(userDetail);
    });

    // setState(() {});
    return _searchResult;
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: new Scaffold(
        body: SafeArea(
          child: Provider.of<Userprovider>(context).token == null
              ? Center(child: Signinchecher())
              : new Column(
                  children: <Widget>[
                    new Container(
                      child: new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Card(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: textcolor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: new ListTile(
                              leading: new Icon(Icons.search),
                              title: new TextField(
                                controller: controller,
                                decoration: new InputDecoration(
                                    hintText: 'بحث', border: InputBorder.none),
                              ),
                              trailing: new IconButton(
                                icon: new Icon(
                                  Icons.cancel,
                                  size: controller.text.isEmpty
                                      ? 0
                                      : SizeConfig.blockSizeVertical * 3,
                                ),
                                onPressed: () {
                                  controller.clear();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Boldaccectcolor(text: "الفرق المفضلة"),
                          IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Countrylistscreen()));
                              }),
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: FavouriteAPI().getfavourite(
                          Provider.of<Userprovider>(context, listen: false)
                              .token), //Here we will call our getData() method,
                      builder: (context, snapshot) {
                        //the future builder is very intersting to use when you work with api
                        if (snapshot.hasData) {
                          if (snapshot.hasData) {
                            if (onSearchTextChanged(
                                    controller.text, snapshot.data) ==
                                null)
                              return Favlist(
                                favteams: snapshot.data,
                              );
                          } else {
                            return Favlist(
                              favteams: onSearchTextChanged(
                                  controller.text, snapshot.data),
                            );
                          }
                        } else {
                          return Expanded(
                            child: Center(
                                child: Theme(
                              data: Theme.of(context)
                                  .copyWith(accentColor: accentcolor),
                              child: new CircularProgressIndicator(
                                backgroundColor: Colors.black26,
                              ),
                            )),
                          );
                        }
                      }, // here we will buil the app layout
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // onSearchTextChanged(String text) async {
  //   _searchResult.clear();
  //   if (text.isEmpty) {
  //     setState(() {});
  //     return;
  //   }

  //   favteams.forEach((userDetail) {
  //     if (userDetail.teamname.toUpperCase().contains(text.toUpperCase()) ||
  //         userDetail.teamname.toUpperCase().contains(text.toUpperCase()))
  //       _searchResult.add(userDetail);
  //   });

  //   setState(() {});
  // }
}
