import 'package:flutter/material.dart';
import 'badge_widget.dart';

class AppbarWidget extends AppBar {
  AppbarWidget()
      : super(
          backgroundColor: Color(0xFFF3F3F3),
          title: Row(
            children: [
              Text('내 플랜'),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 50,
                  child: BadgeWidget(badgeText: "요약"),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // 더보기 버튼이 눌렸을 때 수행할 동작 추가
              },
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                // 더보기 버튼이 눌렸을 때 수행할 동작 추가
              },
            ),
          ],
        );
}
