// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/report_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportCardModelImpl _$$ReportCardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportCardModelImpl(
      title: json['title'] as String?,
      count: json['count'] as String?,
      color: json['color'] as String?,
      subtitle: json['subtitle'] as String?,
      isCountWord: json['isCountWord'] as bool? ?? false,
    );

Map<String, dynamic> _$$ReportCardModelImplToJson(
        _$ReportCardModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'count': instance.count,
      'color': instance.color,
      'subtitle': instance.subtitle,
      'isCountWord': instance.isCountWord,
    };
