import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_study/database/database.dart';
import 'package:flutter_study/database/repository/plan_repository.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';
import 'package:flutter_study/enum/plan_history_type.dart';

class AddHistoryViewModel extends ChangeNotifier {
  final PlanRepository planRepository = PlanRepository(Database().planDao);

  final int planId;
  late PlanEntity plan;
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();
  final FocusNode _priceTextFieldFocusNode = FocusNode();
  final FocusNode _contentTextFieldFocusNode = FocusNode();
  String _emoji = '😀';
  DateTime _date = DateTime.now();
  bool _isConsumption = true;
  bool _isPriceFieldDeleteIconVisible = false;
  bool _isContentFieldDeleteIconVisible = false;

  AddHistoryViewModel(this.planId) {
    _priceTextController.addListener(() => _onTextFieldChanged('price'));
    _contentTextController.addListener(() => _onTextFieldChanged('content'));

    _priceTextFieldFocusNode.addListener(_onFocusChanged);
    _contentTextFieldFocusNode.addListener(_onFocusChanged);
  }

  void _onTextFieldChanged(String key) {
    if (key == 'price') {
      _isPriceFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
    } else if (key == 'content') {
      _isContentFieldDeleteIconVisible = _contentTextController.text.isNotEmpty;
    }

    notifyListeners();
  }

  void _onFocusChanged() {
    if (_priceTextFieldFocusNode.hasFocus) {
      _isContentFieldDeleteIconVisible = false;
      _isPriceFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
    } else if (_contentTextFieldFocusNode.hasFocus) {
      _isPriceFieldDeleteIconVisible = false;
      _isContentFieldDeleteIconVisible = _contentTextController.text.isNotEmpty;
    }

    notifyListeners();
  }

  void getPlan() async {
    // TODO : LateInitializationError: Field 'plan' has not been initialized. 오류 해결
    plan = await planRepository.getPlan(planId);
    notifyListeners();
  }

  TextEditingController get priceTextController => _priceTextController;
  TextEditingController get contentTextController => _contentTextController;
  FocusNode get priceTextFieldFocusNode => _priceTextFieldFocusNode;
  FocusNode get contentTextFieldFocusNode => _contentTextFieldFocusNode;
  String get emoji => _emoji;
  DateTime get date => _date;
  bool get isConsumption => _isConsumption;
  bool get isPriceFieldDeleteIconVisible => _isPriceFieldDeleteIconVisible;
  bool get isContentFieldDeleteIconVisible => _isContentFieldDeleteIconVisible;

  void setEmoji(String emoji) {
    _emoji = emoji;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  void setConsumption() {
    _isConsumption = !_isConsumption;
    notifyListeners();
  }

  void setPriceFieldDeleteIconVisible() {
    _isPriceFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
    notifyListeners();
  }

  void setContentFieldDeleteIconVisible() {
    _isContentFieldDeleteIconVisible = _contentTextController.text.isNotEmpty;
    notifyListeners();
  }

  PlanHistoryEntity get toPlanHistoryEntity {
    // TODO : API 소비하여 데이터 저장
    return PlanHistoryEntity(
        id: 999,
        type: _isConsumption
            ? PlanHistoryType.consumption
            : PlanHistoryType.income,
        amount: int.parse(_priceTextController.text.replaceAll(',', '')),
        memo: _contentTextController.text,
        createAt: DateTime.now());
  }
}
