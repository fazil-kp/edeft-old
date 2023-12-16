// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/response_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseStatusCodeImpl _$$ResponseStatusCodeImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseStatusCodeImpl(
      state: $enumDecodeNullable(_$ResponseStateEnumMap, json['state']) ??
          ResponseState.none,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ResponseStatusCodeImplToJson(
        _$ResponseStatusCodeImpl instance) =>
    <String, dynamic>{
      'state': _$ResponseStateEnumMap[instance.state]!,
      'message': instance.message,
    };

const _$ResponseStateEnumMap = {
  ResponseState.success: 'success',
  ResponseState.error: 'error',
  ResponseState.loading: 'loading',
  ResponseState.warning: 'warning',
  ResponseState.none: 'none',
};
