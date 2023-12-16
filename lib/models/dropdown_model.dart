// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/dropdown_model.freezed.dart';
part '../gen/dropdown_model.g.dart';

@freezed
abstract class DropDownModel with _$DropDownModel {
  @JsonSerializable(explicitToJson: true)
  const factory DropDownModel({
    @Default("") String? title,
    @Default("")String? value,
    @Default(false) bool? isSelected,
  }) = _DropDownModel;

  factory DropDownModel.fromJson(Map<String, dynamic> json) =>
      _$DropDownModelFromJson(json);
}