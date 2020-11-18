import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/screens/homescreen.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;

  void logincheck() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    String x = await p.get("token");
    String y = p.get("username");
    if (x != null) {
      Provider.of<Userprovider>(context, listen: false).settoken(
        x,
      );
      Provider.of<Userprovider>(context, listen: false).setusername(
        y,
      );
    } else {
      Provider.of<Userprovider>(context, listen: false).settoken(null);
    }
    print(
        "provider from login check ${Provider.of<Userprovider>(context, listen: false).token}");
  }

  @override
  void initState() {
    // Provider.of<Userprovider>(context, listen: false).getfav();
    super.initState();
    logincheck();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => Homescreen()));
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: new Scaffold(
              body: Column(
                children: <Widget>[
                  Container(
                    color: Color(0xffF2FBF9),
                    height: SizeConfig.blockSizeVertical * 75,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Opacity(
                          opacity: opacity.value,
                          child: new Image.asset(
                            'asset/Gulf Goal  splash screen Logo.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
