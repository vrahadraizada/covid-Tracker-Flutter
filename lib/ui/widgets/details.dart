import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String status;
  final String label;
  final Color colour;

  Details({this.status, this.label, this.colour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          Text(
            status,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colour,
            ),
          ),
        ],
      ),
    );
  }
}
