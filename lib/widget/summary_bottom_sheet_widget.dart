import 'package:flutter/material.dart';

class SummaryBottomSheetWidget {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 높이 전체를 사용하는 true
      builder: (BuildContext context) {
        return _buildSummaryBottomSheetContent(context);
      },
    );
  }

  static Widget _buildSummaryBottomSheetContent(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double sheetHeight = screenHeight * 0.9; // 90%의 높이

    return Container(
      padding: EdgeInsets.all(16.0),
      height: sheetHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.horizontal_rule),
          // TODO: 위로...더 붙이고 싶다
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(Icons.horizontal_rule),
          //   ],
          // ),

          // 더미데이터
          Text(
            '요약 정보',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('총 소비'),
            onTap: () {
              // 일정 요약 로직을 추가할 수 있습니다.
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text('총 수입'),
            onTap: () {
              // 통계 요약 로직을 추가할 수 있습니다.
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}