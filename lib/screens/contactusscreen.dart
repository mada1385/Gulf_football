import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';

class Contactusscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical * 2.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Boldaccectcolor(
                              text: "اتصل بنا",
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Contenttext(
                            data: "احصل على المساعدة والدعم أو تواصل معنا",
                            size: SizeConfig.blockSizeVertical * 2.5,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical * 2.5),
                        child: Card(
                          elevation: 20,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.mail,
                                  color: accentcolor,
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                                title: Contenttext(
                                  data: "support.gulfgoal@gmail.com",
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.phone,
                                  color: accentcolor,
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                                title: Contenttext(
                                  data: "974 4022 6000",
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.location_on,
                                  color: accentcolor,
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                                title: Contenttext(
                                  data:
                                      "No . 434 .Opp .central hall office Doha Qatar",
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Boldaccectcolor(
                            text: "منصات التواصل الاجتماعي",
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          elevation: 20,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.facebookF,
                                  color: accentcolor,
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                                title: Contenttext(
                                  data: "gulfgoalapp",
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.twitter,
                                  color: accentcolor,
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                                title: Contenttext(
                                  data: "gulfgoalapp",
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.instagram,
                                  color: accentcolor,
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                                title: Contenttext(
                                  data: "gulfgoalapp",
                                  size: SizeConfig.blockSizeVertical * 2.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
