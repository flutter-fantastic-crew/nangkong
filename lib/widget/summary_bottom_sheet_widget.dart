import 'package:flutter/material.dart';
import 'package:nangkong/widget/total_amount_widget.dart';

class SummaryBottomSheetWidget {
  static void show(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _buildSummaryBottomSheetContent(context);
      },
    );
  }

  static Widget _buildSummaryBottomSheetContent(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.88, // 88% 높이
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: <Widget>[
            // 더미데이터
            Container(
              padding: EdgeInsets.only(left: 30.0),
              margin: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                '요약',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TotalAmountWidget(),
                ),
                SizedBox(width: 15.0), // ListTile 사이 간격 조절
                Expanded(
                  child: TotalAmountWidget(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
