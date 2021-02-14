import 'package:covidtracker/ui/widgets/country_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/reports.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reports = Provider.of<Reports>(context, listen: false).reports;
    return ListView.builder(
      padding: EdgeInsets.all(15),
      itemCount: reports.length,
      itemBuilder: (context, index) => CountryCard(index: index),
    );
  }
}
