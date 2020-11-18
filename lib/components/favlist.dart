import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/teams.dart';
import 'package:gulf_football/services/favAPI.dart';
import 'package:provider/provider.dart';

class Favlist extends StatefulWidget {
  const Favlist({
    Key key,
    @required this.favteams,
  }) : super(key: key);

  final List<Teams> favteams;

  @override
  _FavlistState createState() => _FavlistState();
}

class _FavlistState extends State<Favlist> {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: Card(
        elevation: 30,
        child: new ListView.builder(
          itemCount: widget.favteams.length,
          itemBuilder: (context, index) {
            return new Card(
              child: new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: new NetworkImage(
                    widget.favteams[index].teambadge,
                  ),
                ),
                title: new Text(widget.favteams[index].teamname),
                trailing: IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.red.shade900,
                    ),
                    onPressed: () async {
                      var res = await FavouriteAPI().deletefavourite(
                          Provider.of<Userprovider>(context, listen: false)
                              .token,
                          widget
                              .favteams[widget.favteams
                                  .indexOf(widget.favteams[index])]
                              .id);
                      if (res["success"]) {
                        HapticFeedback.mediumImpact();
                        print(widget.favteams.length);
                        Scaffold.of(context).showSnackBar(SnackBar(
                            elevation: 10,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            backgroundColor: accentcolor,
                            content: Container(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "تم المسح بنجاح",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))));
                        setState(() {
                          if (widget.favteams.length != 1) {
                            widget.favteams.removeAt(widget.favteams
                                .indexOf(widget.favteams[index]));
                          } else {
                            widget.favteams.clear();
                          }
                        });
                      } else {
                        HapticFeedback.mediumImpact();
                        Future.delayed(Duration(milliseconds: 30), () {
                          // 5s over, navigate to a new page
                          HapticFeedback.mediumImpact();
                        });

                        Scaffold.of(context).showSnackBar(SnackBar(
                            elevation: 10,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            backgroundColor: accentcolor,
                            content: Container(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "هناك خطأ ما",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))));
                      }
                    }),
              ),
              margin: const EdgeInsets.all(0.0),
            );
          },
        ),
      ),
    );
  }
}
