import 'package:flutter/material.dart';
import 'package:gulf_football/components/newscard.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/news.dart';
import 'package:gulf_football/screens/newsdetails.dart';
import 'package:provider/provider.dart';

class Latestnewslist extends StatefulWidget {
  const Latestnewslist({
    Key key,
    @required this.news,
    @required this.ishomescreen,
  }) : super(key: key);

  final List<News> news;
  final bool ishomescreen;

  @override
  _LatestnewslistState createState() => _LatestnewslistState();
}

class _LatestnewslistState extends State<Latestnewslist> {
  List<News> sorteddata() {
    List<News> sortednews;
    if (!widget.ishomescreen) {
      print(widget.news);
      if (Provider.of<Userprovider>(context).initvaluenews == "all tags") {
        setState(() {
          print("notsorted");
          sortednews = widget.news;
        });
      } else {
        setState(() {
          print(Provider.of<Userprovider>(context).initvaluenews);
          sortednews = widget.news
              .where((i) =>
                  i.tag == Provider.of<Userprovider>(context).initvaluenews)
              .toList();
        });
      }
      return sortednews;
    } else {
      setState(() {
        print("notsorted");
        sortednews = widget.news;
      });
      return sortednews;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sorteddata().map((i) {
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
              child: Newscard(
                news: i,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
