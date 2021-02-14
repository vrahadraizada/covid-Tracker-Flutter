import 'package:covidtracker/ui/widgets/status_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/reports.dart';
import 'package:intl/intl.dart';

class GlobalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Reports>(
      builder: (context, model, child) {
        return GridView(
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            StatusCard(
              icon: 'assets/images/icons/total.png',
              status: NumberFormat.compact().format(
                double.parse(model.globalCases.totalCases),
              ),
              label: 'Total',
              colour: Colors.redAccent,
            ),
            StatusCard(
              icon: 'assets/images/icons/new.png',
              status: NumberFormat.compact().format(
                double.parse(model.globalCases.newCases),
              ),
              label: 'New',
              colour: Colors.orangeAccent,
            ),
            StatusCard(
              icon: 'assets/images/icons/active.png',
              status: NumberFormat.compact().format(
                double.parse(model.globalCases.activeCases),
              ),
              label: 'Active',
              colour: Colors.tealAccent,
            ),
            StatusCard(
              icon: 'assets/images/icons/critical.png',
              status: NumberFormat.compact().format(
                double.parse(model.globalCases.criticalCases),
              ),
              label: 'Critical',
              colour: Colors.cyanAccent,
            ),
            StatusCard(
              icon: 'assets/images/icons/recovered.png',
              status: NumberFormat.compact().format(
                double.parse(model.globalCases.recoveredCases),
              ),
              label: 'Recovered',
              colour: Colors.greenAccent,
            ),
            StatusCard(
              icon: 'assets/images/icons/death.png',
              status: NumberFormat.compact().format(
                double.parse(model.globalCases.totalDeaths),
              ),
              label: 'Deaths',
              colour: Colors.pink,
            ),
          ],
        );
      },
    );
  }
}
