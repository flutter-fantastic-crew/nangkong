import 'package:flutter/material.dart';
import 'package:nangkong/entity/plan_data_entity.dart';
import 'package:nangkong/entity/plan_history_entity.dart';

class HomePageViewModel with ChangeNotifier {
  final planSliderController = PageController(initialPage: 0);

  final List<PlanDataEntity> _plans = [
    PlanDataEntity(
        planId: 0,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now(),
        planMemo: "메모메모메모메모",
        planName: "안녕하세요 이름입니다",
        planIcon: "아이콘",
        planHistory: [
          PlanHistoryEntity(
            planHistoryId: 0,
            memo: "메모메모",
            type: "테슷트타입",
            createAt: DateTime.now(),
            expenses: 100,
          ),
          PlanHistoryEntity(
            planHistoryId: 1,
            memo: "메모메모1",
            type: "테슷트타입",
            createAt: DateTime.now(),
            expenses: 200,
          )
        ],
        totalPlan: 1000),
    PlanDataEntity(
        planId: 0,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now(),
        planMemo: "안뇽하세요",
        planName: "두개일때만 움직이넹",
        planIcon: "아이콘",
        planHistory: [
          PlanHistoryEntity(
            planHistoryId: 0,
            memo: "메모메모",
            type: "테슷트타입",
            createAt: DateTime.now(),
            expenses: 100,
          ),
          PlanHistoryEntity(
            planHistoryId: 1,
            memo: "메모메모1",
            type: "테슷트타입",
            createAt: DateTime.now(),
            expenses: 200,
          )
        ],
        totalPlan: 1000)
  ];
  List<PlanDataEntity> get plans => _plans;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  void changePage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  void addPlan(PlanDataEntity plan) {
    _plans.add(plan);
    notifyListeners();
  }
}