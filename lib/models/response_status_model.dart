import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/response_status_model.freezed.dart';
part '../gen/response_status_model.g.dart';

@freezed
abstract class ResponseStatusCode with _$ResponseStatusCode {
  const factory ResponseStatusCode({
    @Default(ResponseState.none) ResponseState state,
    String? message,
  }) = _ResponseStatusCode;

  factory ResponseStatusCode.fromJson(Map<String, dynamic> json) => _$ResponseStatusCodeFromJson(json);
}

enum ResponseState { success, error, loading, warning, none }

// Extension for ResponseState where different state will return different color
extension ResponseStateExtension on ResponseState {
  Color get color {
    switch (this) {
      case ResponseState.success:
        return Colors.green;
      case ResponseState.error:
        return Colors.red;
      case ResponseState.loading:
        return Colors.blue;
      case ResponseState.warning:
        return Colors.orange;
      case ResponseState.none:
        return Colors.transparent;
    }
  }
}
