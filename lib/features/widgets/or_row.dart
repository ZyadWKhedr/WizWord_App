import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';

class OrRow extends StatelessWidget {
  const OrRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: Colors.black, // Adjust color if needed
            thickness: 1, // Adjust thickness if needed
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'OR',
            style: TextStyle(
                color: mainColor, // Adjust color if needed
                fontSize: 18,
                fontWeight: FontWeight.bold // Adjust font size if needed
                ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.black, // Adjust color if needed
            thickness: 1, // Adjust thickness if needed
          ),
        ),
      ],
    );
  }
}
