import 'package:flutter/material.dart';

class BadgeWidget extends Container {
  BadgeWidget({required this.badgeText})
      : super(
    height: 28,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Color(0xffB1B1B1),
    ),
    alignment: Alignment.center,
    child: Text(
      badgeText,
      style: TextStyle(fontSize: 15, color: Color(0xffffffff)),
    ),
  );

  final String badgeText;
}