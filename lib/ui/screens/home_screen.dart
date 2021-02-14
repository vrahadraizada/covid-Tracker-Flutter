import 'package:covidtracker/ui/screens/country_screen.dart';
import 'package:covidtracker/ui/screens/global_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('COVID TRACKER'),
          centerTitle: true,
          elevation: 3,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'GLOBAL',
                icon: FaIcon(FontAwesomeIcons.globeAsia),
              ),
              Tab(
                text: 'COUNTRIES',
                icon: FaIcon(FontAwesomeIcons.listAlt),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GlobalScreen(),
            CountryScreen(),
          ],
        ),
      ),
    );
  }
}
