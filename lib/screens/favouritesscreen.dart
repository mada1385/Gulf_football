// import 'package:flutter/material.dart';
// import 'package:gulf_football/components/customsearch.dart';
// import 'package:gulf_football/components/texts.dart';
// import 'package:gulf_football/config/colors.dart';
// import 'package:gulf_football/models/teams.dart';

// class SearchState extends StatelessWidget {
//   List<Teams> favteams = [
//     Teams("chelsea", "https://apiv2.apifootball.com/badges/2616_chelsea.png",
//         "id"),
//     Teams("liverpool",
//         "https://apiv2.apifootball.com/badges/2621_liverpool.png", "id"),
//     Teams("realmadrid", "teambadge", "id"),
//     Teams("realmadrid", "teambadge", "id"),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Container(
//         child: ListView(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(
//                 20,
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                     border: Border.all(color: textcolor, width: 1.5)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: GestureDetector(
//                     onTap: () {
//                       showSearch(
//                         context: context,
//                         delegate: CustomSearchDelegate(favteams),
//                       );
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(left: 20),
//                           child: Contenttext(
//                             data: "tap to search for teams",
//                             size: 15,
//                           ),
//                         ),
//                         Icon(
//                           Icons.search,
//                           color: textcolor,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:gulf_football/components/signinchecker.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/teams.dart';
import 'package:provider/provider.dart';

class Favoutitesscreen extends StatefulWidget {
  @override
  _FavoutitesscreenState createState() => new _FavoutitesscreenState();
}

class _FavoutitesscreenState extends State<Favoutitesscreen> {
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  // Future<Null> getUserDetails() async {
  //   final response = await http.get(url);
  //   final responseJson = json.decode(response.body);

  //   setState(() {
  //     for (Map user in responseJson) {
  //       _userDetails.add(UserDetails.fromJson(user));
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   // getUserDetails();
  // }
  List<Teams> favteams = [
    Teams("Chelsea", "https://apiv2.apifootball.com/badges/2616_chelsea.png",
        "id"),
    Teams("Liverpool",
        "https://apiv2.apifootball.com/badges/2621_liverpool.png", "id"),
    Teams("Real madrid",
        "https://apiv2.apifootball.com/badges/7099_real-madrid.png", "id"),
    Teams("barcalona",
        "https://apiv2.apifootball.com/badges/7105_barcelona.png", "id"),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                              onChanged: onSearchTextChanged,
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
                                onSearchTextChanged('');
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
                            icon: Icon(Icons.add_circle), onPressed: null),
                      ],
                    ),
                  ),
                  new Expanded(
                    child: _searchResult.length != 0 ||
                            controller.text.isNotEmpty
                        ? Card(
                            elevation: 30,
                            child: new ListView.builder(
                              itemCount: _searchResult.length,
                              itemBuilder: (context, i) {
                                return new Container(
                                  child: new ListTile(
                                    leading: new CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: new NetworkImage(
                                        _searchResult[i].teambadge,
                                      ),
                                    ),
                                    title: new Text(_searchResult[i].teamname),
                                    trailing: IconButton(
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: Colors.red.shade900,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            favteams.removeAt(favteams
                                                .indexOf(_searchResult[i]));
                                            _searchResult.removeAt(i);
                                          });
                                        }),
                                  ),
                                  margin: const EdgeInsets.all(0.0),
                                );
                              },
                            ),
                          )
                        : Card(
                            elevation: 30,
                            child: new ListView.builder(
                              itemCount: favteams.length,
                              itemBuilder: (context, index) {
                                return new Card(
                                  child: new ListTile(
                                    leading: new CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: new NetworkImage(
                                        favteams[index].teambadge,
                                      ),
                                    ),
                                    title: new Text(favteams[index].teamname),
                                    trailing: IconButton(
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: Colors.red.shade900,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            favteams.removeAt(index);
                                          });
                                        }),
                                  ),
                                  margin: const EdgeInsets.all(0.0),
                                );
                              },
                            ),
                          ),
                  ),
                ],
              ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    favteams.forEach((userDetail) {
      if (userDetail.teamname.toUpperCase().contains(text.toUpperCase()) ||
          userDetail.teamname.toUpperCase().contains(text.toUpperCase()))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<Teams> _searchResult = [];
