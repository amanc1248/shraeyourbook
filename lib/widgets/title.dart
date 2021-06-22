import 'package:flutter/material.dart';
import 'package:shareyourbook/constants/constants.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  ScreenTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: kTitleStyle,
      ),
    );
  }
}
