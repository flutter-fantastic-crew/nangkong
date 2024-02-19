import 'package:flutter/material.dart';
import 'package:nangkong/widget/badge2_widget.dart';
import 'package:nangkong/widget/badge_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('내 플랜'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 50,
                child: BadgeWidget2(badgeText: "요약"),
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
      ),
      body: Center(
        child: SizedBox(
          width: 108,
          child: BadgeWidget2(badgeText: "요약"),
        ),
      ),
    );
  }
}