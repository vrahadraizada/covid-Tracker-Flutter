import 'package:covidtracker/ui/constants/constants.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatefulWidget {
  final String icon;
  final String status;
  final String label;
  final Color colour;

  StatusCard({this.icon, this.label, this.status, this.colour});

  @override
  _StatusCardState createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> with TickerProviderStateMixin {
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
      curve: Curves.easeIn,
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
      child: Card(
        shape: kCardShape,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              widget.icon,
              height: 60,
            ),
            Text(
              widget.status,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: widget.colour,
              ),
            ),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
