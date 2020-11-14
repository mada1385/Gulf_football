import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/news.dart';

class Newscard extends StatelessWidget {
  final News news;

  const Newscard({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ConnectivityWidgetWrapper(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.black12,
                    offset: Offset(0, .75),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      child: new Image(
                          image: new NetworkImageWithRetry(
                            news.image,
                          ),
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: SizeConfig.blockSizeHorizontal * 40)),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      news.title,
                      style: TextStyle(color: textcolor),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
