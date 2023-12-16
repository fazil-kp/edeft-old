import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/report_card_model.freezed.dart';
part '../gen/report_card_model.g.dart';

@freezed
class ReportCardModel with _$ReportCardModel {
  factory ReportCardModel({String? title, String? count, String? color, String? subtitle, @Default(false) bool isCountWord}) = _ReportCardModel;
  factory ReportCardModel.fromJson(Map<String, dynamic> json) => _$ReportCardModelFromJson(json);
}
