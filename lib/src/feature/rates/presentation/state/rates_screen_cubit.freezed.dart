// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rates_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RatesCubitState {
  List<Rate> get rates => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatesCubitStateCopyWith<RatesCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatesCubitStateCopyWith<$Res> {
  factory $RatesCubitStateCopyWith(
          RatesCubitState value, $Res Function(RatesCubitState) then) =
      _$RatesCubitStateCopyWithImpl<$Res, RatesCubitState>;
  @useResult
  $Res call({List<Rate> rates});
}

/// @nodoc
class _$RatesCubitStateCopyWithImpl<$Res, $Val extends RatesCubitState>
    implements $RatesCubitStateCopyWith<$Res> {
  _$RatesCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rates = null,
  }) {
    return _then(_value.copyWith(
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatesCubitStateCopyWith<$Res>
    implements $RatesCubitStateCopyWith<$Res> {
  factory _$$_RatesCubitStateCopyWith(
          _$_RatesCubitState value, $Res Function(_$_RatesCubitState) then) =
      __$$_RatesCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Rate> rates});
}

/// @nodoc
class __$$_RatesCubitStateCopyWithImpl<$Res>
    extends _$RatesCubitStateCopyWithImpl<$Res, _$_RatesCubitState>
    implements _$$_RatesCubitStateCopyWith<$Res> {
  __$$_RatesCubitStateCopyWithImpl(
      _$_RatesCubitState _value, $Res Function(_$_RatesCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rates = null,
  }) {
    return _then(_$_RatesCubitState(
      rates: null == rates
          ? _value._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as List<Rate>,
    ));
  }
}

/// @nodoc

class _$_RatesCubitState implements _RatesCubitState {
  _$_RatesCubitState({required final List<Rate> rates}) : _rates = rates;

  final List<Rate> _rates;
  @override
  List<Rate> get rates {
    if (_rates is EqualUnmodifiableListView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rates);
  }

  @override
  String toString() {
    return 'RatesCubitState(rates: $rates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatesCubitState &&
            const DeepCollectionEquality().equals(other._rates, _rates));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatesCubitStateCopyWith<_$_RatesCubitState> get copyWith =>
      __$$_RatesCubitStateCopyWithImpl<_$_RatesCubitState>(this, _$identity);
}

abstract class _RatesCubitState implements RatesCubitState {
  factory _RatesCubitState({required final List<Rate> rates}) =
      _$_RatesCubitState;

  @override
  List<Rate> get rates;
  @override
  @JsonKey(ignore: true)
  _$$_RatesCubitStateCopyWith<_$_RatesCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
