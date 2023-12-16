// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/response_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseStatusCode _$ResponseStatusCodeFromJson(Map<String, dynamic> json) {
  return _ResponseStatusCode.fromJson(json);
}

/// @nodoc
mixin _$ResponseStatusCode {
  ResponseState get state => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseStatusCodeCopyWith<ResponseStatusCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseStatusCodeCopyWith<$Res> {
  factory $ResponseStatusCodeCopyWith(
          ResponseStatusCode value, $Res Function(ResponseStatusCode) then) =
      _$ResponseStatusCodeCopyWithImpl<$Res, ResponseStatusCode>;
  @useResult
  $Res call({ResponseState state, String? message});
}

/// @nodoc
class _$ResponseStatusCodeCopyWithImpl<$Res, $Val extends ResponseStatusCode>
    implements $ResponseStatusCodeCopyWith<$Res> {
  _$ResponseStatusCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseStatusCodeImplCopyWith<$Res>
    implements $ResponseStatusCodeCopyWith<$Res> {
  factory _$$ResponseStatusCodeImplCopyWith(_$ResponseStatusCodeImpl value,
          $Res Function(_$ResponseStatusCodeImpl) then) =
      __$$ResponseStatusCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResponseState state, String? message});
}

/// @nodoc
class __$$ResponseStatusCodeImplCopyWithImpl<$Res>
    extends _$ResponseStatusCodeCopyWithImpl<$Res, _$ResponseStatusCodeImpl>
    implements _$$ResponseStatusCodeImplCopyWith<$Res> {
  __$$ResponseStatusCodeImplCopyWithImpl(_$ResponseStatusCodeImpl _value,
      $Res Function(_$ResponseStatusCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = freezed,
  }) {
    return _then(_$ResponseStatusCodeImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseStatusCodeImpl implements _ResponseStatusCode {
  const _$ResponseStatusCodeImpl(
      {this.state = ResponseState.none, this.message});

  factory _$ResponseStatusCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseStatusCodeImplFromJson(json);

  @override
  @JsonKey()
  final ResponseState state;
  @override
  final String? message;

  @override
  String toString() {
    return 'ResponseStatusCode(state: $state, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseStatusCodeImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseStatusCodeImplCopyWith<_$ResponseStatusCodeImpl> get copyWith =>
      __$$ResponseStatusCodeImplCopyWithImpl<_$ResponseStatusCodeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseStatusCodeImplToJson(
      this,
    );
  }
}

abstract class _ResponseStatusCode implements ResponseStatusCode {
  const factory _ResponseStatusCode(
      {final ResponseState state,
      final String? message}) = _$ResponseStatusCodeImpl;

  factory _ResponseStatusCode.fromJson(Map<String, dynamic> json) =
      _$ResponseStatusCodeImpl.fromJson;

  @override
  ResponseState get state;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ResponseStatusCodeImplCopyWith<_$ResponseStatusCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
