import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:gulf_football/screens/splash_page.dart';
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
          Locale("fa", "IR"),
          Locale(
              'ar', ''), // Arabic// OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: Locale('ar', ''),
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
