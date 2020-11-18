import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/standinglist.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:gulf_football/services/standingsAPI.dart';
import 'package:provider/provider.dart';

class Standingscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: FutureBuilder(
        future: StandiingAPI(Provider.of<Userprovider>(context)
                .leagueid[Provider.of<Userprovider>(context).leaugeindex])
            .getTable(), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            print((snapshot.data).length);
            return Standinglist(
              data: snapshot.data,
            );
          } else {
            return Center(
                child: Theme(
              data: Theme.of(context).copyWith(accentColor: accentcolor),
              child: new CircularProgressIndicator(
                backgroundColor: Colors.black26,
              ),
            ));
          }
        }, // here we will buil the app layout
      ),
    );
  }
}
