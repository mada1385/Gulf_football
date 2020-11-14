// import 'package:flutter/material.dart';
// import 'package:gulf_football/config/mediaqueryconfig.dart';
// import '../models/team_model.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // import '../screens/detail_screen.dart';

// class TeamList extends StatelessWidget {
//   final String idLeague;
//   TeamList(this.idLeague);

//   Future<List<Team>> getTeam() async {
//     var url =
//         "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=$idLeague";
//     var data = await http.get(url);

//     var jsonData = jsonDecode(data.body)["teams"] as List;
//     final List<Team> teams = [];

//     for (var t in jsonData) {
//       Team team = Team(
//         idTeam: t["idTeam"],
//         strTeamBadge: t["strTeamBadge"],
//         strTeam: t["strTeam"],
//         intFormedYear: t["intFormedYear"],
//         strStadium: t["strStadium"],
//         strDescriptionEN: t["strDescriptionEN"],
//       );
//       teams.add(team);
//     }

//     //print(teams.length);

//     return teams;
//   }

//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData queryData = MediaQuery.of(context);
//     return Column(
//       children: <Widget>[
//         SizedBox(height: SizeConfig.blockSizeVertical * 2),
//         Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: SizeConfig.blockSizeHorizontal * 2),
//           child: Column(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(
//                     'Team List',
//                     style: TextStyle(
//                       fontSize: SizeConfig.blockSizeVertical * 2,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         SizedBox(height: SizeConfig.blockSizeVertical * 2),
//         Container(
//           height: SizeConfig.blockSizeVertical * 54,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.0),
//               topRight: Radius.circular(20.0),
//             ),
//           ),
//           child: FutureBuilder(
//             future: getTeam(),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return Container(
//                   child: Center(
//                     child: Text("Loading..."),
//                   ),
//                 );
//               } else {
//                 return ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return GestureDetector(
//                       // onTap: () {
//                       //   Navigator.push(
//                       //     context,
//                       //     new MaterialPageRoute(
//                       //         builder: (context) =>
//                       //             DetailScreen(snapshot.data[index])),
//                       //   );
//                       // },
//                       child: Container(
//                         margin: EdgeInsets.all(6.0),
//                         height: SizeConfig.blockSizeVertical * 10,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10.0),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(0.0, 2.0),
//                                 blurRadius: 2.0),
//                           ],
//                         ),
//                         child: ListTile(
//                           leading: Image.network(
//                             snapshot.data[index].strTeamBadge,
//                             height: SizeConfig.blockSizeVertical * 3,
//                           ),
//                           title: Text(
//                             snapshot.data[index].strTeam,
//                             style: TextStyle(
//                               fontSize: SizeConfig.blockSizeVertical * 2,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           subtitle: Text(
//                             snapshot.data[index].strStadium,
//                             style: TextStyle(
//                               fontSize: SizeConfig.blockSizeVertical * 2,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           trailing: Icon(
//                             Icons.arrow_forward_ios,
//                             size: SizeConfig.blockSizeVertical * 2,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         // child: Column(
//                         //   children: <Widget>[
//                         //     Row(
//                         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //       children: <Widget>[
//                         //         // ListTile(
//                         //         //   //leading: Image.network(snapshot.data[index].strTeamBadge),
//                         //         //   title: Text(snapshot.data[index].strTeam),
//                         //         //   subtitle: Text(snapshot.data[index].strStadium),
//                         //         // ),

//                         //         Icon(
//                         //           Icons.arrow_forward_ios,
//                         //           size: 10.0
//                         //         )
//                         //       ],
//                         //     ),
//                         //   ],
//                         // ),
//                       ),
//                     );
//                   },
//                 );
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
