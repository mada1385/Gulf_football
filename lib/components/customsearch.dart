import 'package:flutter/material.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/models/teams.dart';

class CustomSearchDelegate extends SearchDelegate {
  var mainColor = Color(0xff1B3954);
  var textColor = Color(0xff727272);
  var accentColor = Color(0xff16ADE1);
  var whiteText = Color(0xffF5F5F5);
  final List<Teams> allNames;
  List<Teams> suggestion = [
    Teams("real madrid", "teambadge", "id"),
    Teams("barcelona", "teambadge", "id"),
    Teams("liverpool", "teambadge", "id"),
  ];
  List<Teams> searchResult = List();

  CustomSearchDelegate(this.allNames);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult.clear();
    searchResult = allNames
        .where((element) => element.teamname.startsWith(query))
        .toList();
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            scrollDirection: Axis.vertical,
            children: List.generate(searchResult.length, (index) {
              String item = searchResult[index].teamname;
              return Card(
                elevation: 20,
                color: Colors.white,
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      item,
                      style: TextStyle(color: textcolor),
                    )),
              );
            })),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    final suggestionList = query.isEmpty
        ? suggestion
        : allNames
            .where((element) => element.teamname.startsWith(query))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (query.isEmpty) {
            query = suggestion[index].teamname;
          }
        },
        leading: Icon(query.isEmpty ? Icons.history : Icons.search),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].teamname.substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].teamname.substring(query.length),
                style: TextStyle(color: textColor),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
