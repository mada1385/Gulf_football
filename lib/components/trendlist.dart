import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gulf_football/components/trendnewscard.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/news.dart';
import 'package:gulf_football/screens/newsdetails.dart';

class Trendlist extends StatefulWidget {
  const Trendlist({
    Key key,
    @required this.news,
  }) : super(key: key);

  final List<News> news;

  @override
  _TrendlistState createState() => _TrendlistState();
}

class _TrendlistState extends State<Trendlist> {
  List<Widget> getunderline() {
    List<Widget> w = [];
    for (int i = 0; i < widget.news.length; i++) {
      w.add(
        Container(
          margin: EdgeInsets.all(8.0),
          height: 10,
          width: 25,
          decoration: BoxDecoration(
              // shape: BoxShape.circle,
              border: Border.all(
                  color: pageIndex != i ? accentcolor : Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: pageIndex == i ? accentcolor : Colors.white),
        ),
      );
    }
    return w;
  }

  PageController controller = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      children: [
        Container(
          height: SizeConfig.blockSizeVertical * 30,
          width: double.infinity,
          child: PageView(
            onPageChanged: (value) {
              HapticFeedback.lightImpact();
              setState(() {
                pageIndex = value;
              });
            },
            controller: controller,
            children: widget.news.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Newsdetails(
                                    news: i,
                                  )));
                    },
                    child: TrendNewscard(
                      news: i,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getunderline(),
        )
      ],
    );
  }
}
