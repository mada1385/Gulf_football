import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gulf_football/components/countrylist.dart';
import 'package:gulf_football/screens/contactusscreen.dart';
import 'package:gulf_football/screens/countrylistscreen.dart';
import 'package:gulf_football/screens/forgetpasswordscreen.dart';
import 'package:gulf_football/screens/gamescreen.dart';
import 'package:gulf_football/screens/homescreen.dart';
import 'package:gulf_football/screens/favouritesscreen.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:gulf_football/screens/profileoptions.dart';
import 'package:gulf_football/screens/signinscreen.dart';
import 'package:gulf_football/screens/signupscreen.dart';
import 'package:gulf_football/screens/teamslistscreen.dart';
import 'package:provider/provider.dart';
import 'package:gulf_football/screens/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => Userprovider(),
    child: ConnectivityAppWrapper(
      app: MaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("en", "US"),
          Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: Locale("fa", "IR"),
        title: 'Gulf football',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    ),
  ));
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ConnectivityAppWrapper(
//       app: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: ConnectivityWidgetWrapper(
//             offlineWidget: Nointernetscreen(), child: Homescreen()),
//       ),
//     );
//   }
// }
