class PlanHistoryEntity {
  int planHistoryId; // 예산기록 아이디
  int expenses; // 소비 금액
  String memo; // 메모
  String type; // 소비, 수입
  DateTime createAt; // 기록 남긴일

  PlanHistoryEntity({
    required this.planHistoryId,
    required this.expenses,
    required this.memo,
    required this.type,
    required this.createAt,
  });
}
