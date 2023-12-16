// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/report_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportCardModel _$ReportCardModelFromJson(Map<String, dynamic> json) {
  return _ReportCardModel.fromJson(json);
}

/// @nodoc
mixin _$ReportCardModel {
  String? get title => throw _privateConstructorUsedError;
  String? get count => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  bool get isCountWord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCardModelCopyWith<ReportCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCardModelCopyWith<$Res> {
  factory $ReportCardModelCopyWith(
          ReportCardModel value, $Res Function(ReportCardModel) then) =
      _$ReportCardModelCopyWithImpl<$Res, ReportCardModel>;
  @useResult
  $Res call(
      {String? title,
      String? count,
      String? color,
      String? subtitle,
      bool isCountWord});
}

/// @nodoc
class _$ReportCardModelCopyWithImpl<$Res, $Val extends ReportCardModel>
    implements $ReportCardModelCopyWith<$Res> {
  _$ReportCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? count = freezed,
    Object? color = freezed,
    Object? subtitle = freezed,
    Object? isCountWord = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      isCountWord: null == isCountWord
          ? _value.isCountWord
          : isCountWord // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportCardModelImplCopyWith<$Res>
    implements $ReportCardModelCopyWith<$Res> {
  factory _$$ReportCardModelImplCopyWith(_$ReportCardModelImpl value,
          $Res Function(_$ReportCardModelImpl) then) =
      __$$ReportCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? count,
      String? color,
      String? subtitle,
      bool isCountWord});
}

/// @nodoc
class __$$ReportCardModelImplCopyWithImpl<$Res>
    extends _$ReportCardModelCopyWithImpl<$Res, _$ReportCardModelImpl>
    implements _$$ReportCardModelImplCopyWith<$Res> {
  __$$ReportCardModelImplCopyWithImpl(
      _$ReportCardModelImpl _value, $Res Function(_$ReportCardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? count = freezed,
    Object? color = freezed,
    Object? subtitle = freezed,
    Object? isCountWord = null,
  }) {
    return _then(_$ReportCardModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      isCountWord: null == isCountWord
          ? _value.isCountWord
          : isCountWord // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportCardModelImpl implements _ReportCardModel {
  _$ReportCardModelImpl(
      {this.title,
      this.count,
      this.color,
      this.subtitle,
      this.isCountWord = false});

  factory _$ReportCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportCardModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? count;
  @override
  final String? color;
  @override
  final String? subtitle;
  @override
  @JsonKey()
  final bool isCountWord;

  @override
  String toString() {
    return 'ReportCardModel(title: $title, count: $count, color: $color, subtitle: $subtitle, isCountWord: $isCountWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportCardModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.isCountWord, isCountWord) ||
                other.isCountWord == isCountWord));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, count, color, subtitle, isCountWord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportCardModelImplCopyWith<_$ReportCardModelImpl> get copyWith =>
      __$$ReportCardModelImplCopyWithImpl<_$ReportCardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportCardModelImplToJson(
      this,
    );
  }
}

abstract class _ReportCardModel implements ReportCardModel {
  factory _ReportCardModel(
      {final String? title,
      final String? count,
      final String? color,
      final String? subtitle,
      final bool isCountWord}) = _$ReportCardModelImpl;

  factory _ReportCardModel.fromJson(Map<String, dynamic> json) =
      _$ReportCardModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get count;
  @override
  String? get color;
  @override
  String? get subtitle;
  @override
  bool get isCountWord;
  @override
  @JsonKey(ignore: true)
  _$$ReportCardModelImplCopyWith<_$ReportCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
