// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/dropdown_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DropDownModelImpl _$$DropDownModelImplFromJson(Map<String, dynamic> json) =>
    _$DropDownModelImpl(
      title: json['title'] as String? ?? "",
      value: json['value'] as String? ?? "",
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$DropDownModelImplToJson(_$DropDownModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
      'isSelected': instance.isSelected,
    };
