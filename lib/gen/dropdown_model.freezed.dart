// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/dropdown_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DropDownModel _$DropDownModelFromJson(Map<String, dynamic> json) {
  return _DropDownModel.fromJson(json);
}

/// @nodoc
mixin _$DropDownModel {
  String? get title => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DropDownModelCopyWith<DropDownModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropDownModelCopyWith<$Res> {
  factory $DropDownModelCopyWith(
          DropDownModel value, $Res Function(DropDownModel) then) =
      _$DropDownModelCopyWithImpl<$Res, DropDownModel>;
  @useResult
  $Res call({String? title, String? value, bool? isSelected});
}

/// @nodoc
class _$DropDownModelCopyWithImpl<$Res, $Val extends DropDownModel>
    implements $DropDownModelCopyWith<$Res> {
  _$DropDownModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? value = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DropDownModelImplCopyWith<$Res>
    implements $DropDownModelCopyWith<$Res> {
  factory _$$DropDownModelImplCopyWith(
          _$DropDownModelImpl value, $Res Function(_$DropDownModelImpl) then) =
      __$$DropDownModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? value, bool? isSelected});
}

/// @nodoc
class __$$DropDownModelImplCopyWithImpl<$Res>
    extends _$DropDownModelCopyWithImpl<$Res, _$DropDownModelImpl>
    implements _$$DropDownModelImplCopyWith<$Res> {
  __$$DropDownModelImplCopyWithImpl(
      _$DropDownModelImpl _value, $Res Function(_$DropDownModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? value = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$DropDownModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DropDownModelImpl implements _DropDownModel {
  const _$DropDownModelImpl(
      {this.title = "", this.value = "", this.isSelected = false});

  factory _$DropDownModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DropDownModelImplFromJson(json);

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? value;
  @override
  @JsonKey()
  final bool? isSelected;

  @override
  String toString() {
    return 'DropDownModel(title: $title, value: $value, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DropDownModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, value, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DropDownModelImplCopyWith<_$DropDownModelImpl> get copyWith =>
      __$$DropDownModelImplCopyWithImpl<_$DropDownModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DropDownModelImplToJson(
      this,
    );
  }
}

abstract class _DropDownModel implements DropDownModel {
  const factory _DropDownModel(
      {final String? title,
      final String? value,
      final bool? isSelected}) = _$DropDownModelImpl;

  factory _DropDownModel.fromJson(Map<String, dynamic> json) =
      _$DropDownModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get value;
  @override
  bool? get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$DropDownModelImplCopyWith<_$DropDownModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
