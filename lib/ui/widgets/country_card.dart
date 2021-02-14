import 'package:covidtracker/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/providers/reports.dart';
import 'details.dart';
import 'package:intl/intl.dart';

class CountryCard extends StatefulWidget {
  final int index;

  CountryCard({@required this.index});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    if (_animation.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Consumer<Reports>(
        builder: (context, model, child) {
          return Card(
            shape: kCardShape,
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                    'assets/images/country_flags/${model.reports[widget.index].country}.png'),
              ),
              title: Text(
                model.reports[widget.index].country,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total : ${NumberFormat.compact().format(
                      double.parse(model.reports[widget.index].totalCases),
                    )}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    'Actice : ${NumberFormat.compact().format(
                      double.parse(model.reports[widget.index].activeCases),
                    )}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              shape: kCardShape,
              onTap: () => buildlBottomSheet(context),
            ),
          );
        },
      ),
    );
  }

  Future buildlBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Theme.of(context).cardColor,
      shape: kBottomCardShap,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Consumer<Reports>(
          builder: (context, model, child) {
            return Column(
              children: [
                Text(
                  model.reports[widget.index].country,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Details(
                  label: 'Total',
                  status: NumberFormat.compact().format(
                    double.parse(model.reports[widget.index].totalCases),
                  ),
                  colour: Colors.pink,
                ),
                Details(
                  label: 'New',
                  status: NumberFormat.compact().format(
                    double.parse(model.reports[widget.index].newCases),
                  ),
                  colour: Colors.blue,
                ),
                Details(
                  label: 'Active',
                  status: NumberFormat.compact().format(
                    double.parse(model.reports[widget.index].activeCases),
                  ),
                  colour: Colors.teal,
                ),
                Details(
                  label: 'Critical',
                  status: NumberFormat.compact().format(
                    double.parse(model.reports[widget.index].criticalCases),
                  ),
                  colour: Colors.pink,
                ),
                Details(
                  label: 'Recovered',
                  status: NumberFormat.compact().format(
                    double.parse(model.reports[widget.index].recoveredCases),
                  ),
                  colour: Colors.green,
                ),
                Details(
                  label: 'Deaths',
                  status: NumberFormat.compact().format(
                    double.parse(model.reports[widget.index].totalDeaths),
                  ),
                  colour: Colors.red,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
