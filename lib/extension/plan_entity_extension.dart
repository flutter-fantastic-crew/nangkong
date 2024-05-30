import 'package:flutter_study/database/dto/plan_dto.dart';
import 'package:flutter_study/entity/plan_entity.dart';

extension PlanEntityExtesion on PlanEntity {
  PlanDto toDto() {
    return PlanDto(
      startDate: startDate,
      endDate: endDate,
      type: type,
      name: name,
      memo: memo,
      icon: icon,
      totalAmount: totalAmount,
    );
  }
}
