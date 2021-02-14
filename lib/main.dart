import 'package:covidtracker/ui/constants/constants.dart';
import 'package:covidtracker/ui/screens/home_screen.dart';
import 'package:covidtracker/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/providers/reports.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Reports();
    return ChangeNotifierProvider(
      create: (context) => model,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: kTheme,
        home: FutureBuilder(
          future: model.getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return SplashScreen();
              } else {
                return HomeScreen();
              }
            }
            return HomeScreen();
          },
        ),
      ),
    );
  }
}
