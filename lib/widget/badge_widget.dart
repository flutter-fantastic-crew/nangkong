import 'package:flutter/material.dart';
import 'package:nangkong/widget/summary_bottom_sheet_widget.dart';

class BadgeWidget extends StatelessWidget {
  final String badgeText;
  final VoidCallback? onTap;

  BadgeWidget({required this.badgeText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SummaryBottomSheetWidget.show(context);
      },
      child: Container(
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
      ),
    );
  }
}