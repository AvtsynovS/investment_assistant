// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Rate {
  int get id => throw _privateConstructorUsedError;
  String get rateTitle => throw _privateConstructorUsedError;
  double get transactionCommission => throw _privateConstructorUsedError;
  bool get isMonthlyCommission => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get monthlyCommission => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RateCopyWith<Rate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateCopyWith<$Res> {
  factory $RateCopyWith(Rate value, $Res Function(Rate) then) =
      _$RateCopyWithImpl<$Res, Rate>;
  @useResult
  $Res call(
      {int id,
      String rateTitle,
      double transactionCommission,
      bool isMonthlyCommission,
      bool isActive,
      int monthlyCommission});
}

/// @nodoc
class _$RateCopyWithImpl<$Res, $Val extends Rate>
    implements $RateCopyWith<$Res> {
  _$RateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rateTitle = null,
    Object? transactionCommission = null,
    Object? isMonthlyCommission = null,
    Object? isActive = null,
    Object? monthlyCommission = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rateTitle: null == rateTitle
          ? _value.rateTitle
          : rateTitle // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCommission: null == transactionCommission
          ? _value.transactionCommission
          : transactionCommission // ignore: cast_nullable_to_non_nullable
              as double,
      isMonthlyCommission: null == isMonthlyCommission
          ? _value.isMonthlyCommission
          : isMonthlyCommission // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      monthlyCommission: null == monthlyCommission
          ? _value.monthlyCommission
          : monthlyCommission // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RateCopyWith<$Res> implements $RateCopyWith<$Res> {
  factory _$$_RateCopyWith(_$_Rate value, $Res Function(_$_Rate) then) =
      __$$_RateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String rateTitle,
      double transactionCommission,
      bool isMonthlyCommission,
      bool isActive,
      int monthlyCommission});
}

/// @nodoc
class __$$_RateCopyWithImpl<$Res> extends _$RateCopyWithImpl<$Res, _$_Rate>
    implements _$$_RateCopyWith<$Res> {
  __$$_RateCopyWithImpl(_$_Rate _value, $Res Function(_$_Rate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rateTitle = null,
    Object? transactionCommission = null,
    Object? isMonthlyCommission = null,
    Object? isActive = null,
    Object? monthlyCommission = null,
  }) {
    return _then(_$_Rate(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rateTitle: null == rateTitle
          ? _value.rateTitle
          : rateTitle // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCommission: null == transactionCommission
          ? _value.transactionCommission
          : transactionCommission // ignore: cast_nullable_to_non_nullable
              as double,
      isMonthlyCommission: null == isMonthlyCommission
          ? _value.isMonthlyCommission
          : isMonthlyCommission // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      monthlyCommission: null == monthlyCommission
          ? _value.monthlyCommission
          : monthlyCommission // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Rate implements _Rate {
  const _$_Rate(
      {required this.id,
      required this.rateTitle,
      required this.transactionCommission,
      this.isMonthlyCommission = false,
      this.isActive = false,
      this.monthlyCommission = 0});

  @override
  final int id;
  @override
  final String rateTitle;
  @override
  final double transactionCommission;
  @override
  @JsonKey()
  final bool isMonthlyCommission;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final int monthlyCommission;

  @override
  String toString() {
    return 'Rate(id: $id, rateTitle: $rateTitle, transactionCommission: $transactionCommission, isMonthlyCommission: $isMonthlyCommission, isActive: $isActive, monthlyCommission: $monthlyCommission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rateTitle, rateTitle) ||
                other.rateTitle == rateTitle) &&
            (identical(other.transactionCommission, transactionCommission) ||
                other.transactionCommission == transactionCommission) &&
            (identical(other.isMonthlyCommission, isMonthlyCommission) ||
                other.isMonthlyCommission == isMonthlyCommission) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.monthlyCommission, monthlyCommission) ||
                other.monthlyCommission == monthlyCommission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, rateTitle,
      transactionCommission, isMonthlyCommission, isActive, monthlyCommission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RateCopyWith<_$_Rate> get copyWith =>
      __$$_RateCopyWithImpl<_$_Rate>(this, _$identity);
}

abstract class _Rate implements Rate {
  const factory _Rate(
      {required final int id,
      required final String rateTitle,
      required final double transactionCommission,
      final bool isMonthlyCommission,
      final bool isActive,
      final int monthlyCommission}) = _$_Rate;

  @override
  int get id;
  @override
  String get rateTitle;
  @override
  double get transactionCommission;
  @override
  bool get isMonthlyCommission;
  @override
  bool get isActive;
  @override
  int get monthlyCommission;
  @override
  @JsonKey(ignore: true)
  _$$_RateCopyWith<_$_Rate> get copyWith => throw _privateConstructorUsedError;
}
