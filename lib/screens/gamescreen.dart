import 'package:calendar_strip/calendar_strip.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/allgameslist.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/screens/leaugefixturescreen.dart';
import 'package:intl/intl.dart';

import 'nointernetscreen.dart';

class Gamescreen extends StatefulWidget {
  @override
  _GamescreenState createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  int selectedIndex = 0;
  int leaugeidtab = 2;
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime startDate = DateTime.now().subtract(Duration(days: 1000));
  DateTime endDate = DateTime.now().add(Duration(days: 1000));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 0));
  List<String> league = [
    "كل المباريات",
    "★  المفضلة",
    "Premiere League",
    "Bundesliga",
    "Serie A",
    "La Liga"
  ];
  List<String> leagueid = [null, null, "148", "195", "262", "468"];

  onSelect(data) {
    setState(() {
      selectedDate = data;
    });
  }

  onWeekSelect(data) {
    print("Selected week starting at -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: TextStyle(
          fontSize: SizeConfig.blockSizeVertical * 2,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontStyle: FontStyle.italic,
        ),
      ),
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 1,
          bottom: SizeConfig.safeBlockVertical * .5),
    );
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle = TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 2,
        fontWeight: FontWeight.w800,
        color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 2,
        fontWeight: FontWeight.w800,
        color: Colors.black87);
    TextStyle dayNameStyle =
        TextStyle(fontSize: SizeConfig.blockSizeVertical * 2, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      // _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 1,
          left: SizeConfig.blockSizeHorizontal * .5,
          right: SizeConfig.blockSizeHorizontal * .5,
          bottom: SizeConfig.blockSizeVertical * .5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> mainscreen = [
      Allgameslist(selecteddate: selectedDate),
      Leaguesfixturescreen(
        leaugeidtab: leagueid[leaugeidtab],
        selecteddate: formatter.format(selectedDate),
      )
    ];

    SizeConfig().init(context);
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Color(0xffF7F8FA),
            child: Column(children: [
              Container(
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15.0,
                        offset: Offset(0.0, .75))
                  ], color: Colors.white),
                  height: SizeConfig.safeBlockVertical * 14,
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: CalendarStrip(
                      startDate: startDate,
                      endDate: endDate,
                      selectedDate: selectedDate,
                      onDateSelected: onSelect,
                      onWeekSelected: onWeekSelect,
                      dateTileBuilder: dateTileBuilder,
                      iconColor: Colors.black,
                      monthNameWidget: _monthNameWidget,
                      // markedDates: markedDates,
                      containerDecoration: BoxDecoration(color: Colors.white),
                      addSwipeGesture: true,
                    ),
                  )),
              SizedBox(
                height: 2,
              ),
              Container(
                color: Color(0xffFCFCFC),

                height: SizeConfig.blockSizeVertical * 6,
                //color: Theme.of(context).primaryColor,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: league.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // loadDetails();
                            leaugeidtab = index;
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Container(
                            width: 110,
                            // padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: selectedIndex == index
                                  ? Colors.green
                                  : Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  league[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.9,
                                    fontWeight: FontWeight.w500,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Color(0xFFB4C1C4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              mainscreen[selectedIndex == 0
                  ? 0
                  : selectedIndex == 1
                      ? 0
                      : 1],
            ]),
          ),
        ),
      ),
    );
  }
}
