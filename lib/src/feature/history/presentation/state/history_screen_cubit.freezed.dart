// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryCubitState {
  List<Deal> get closeDeals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryCubitStateCopyWith<HistoryCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCubitStateCopyWith<$Res> {
  factory $HistoryCubitStateCopyWith(
          HistoryCubitState value, $Res Function(HistoryCubitState) then) =
      _$HistoryCubitStateCopyWithImpl<$Res, HistoryCubitState>;
  @useResult
  $Res call({List<Deal> closeDeals});
}

/// @nodoc
class _$HistoryCubitStateCopyWithImpl<$Res, $Val extends HistoryCubitState>
    implements $HistoryCubitStateCopyWith<$Res> {
  _$HistoryCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closeDeals = null,
  }) {
    return _then(_value.copyWith(
      closeDeals: null == closeDeals
          ? _value.closeDeals
          : closeDeals // ignore: cast_nullable_to_non_nullable
              as List<Deal>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryCubitStateCopyWith<$Res>
    implements $HistoryCubitStateCopyWith<$Res> {
  factory _$$_HistoryCubitStateCopyWith(_$_HistoryCubitState value,
          $Res Function(_$_HistoryCubitState) then) =
      __$$_HistoryCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Deal> closeDeals});
}

/// @nodoc
class __$$_HistoryCubitStateCopyWithImpl<$Res>
    extends _$HistoryCubitStateCopyWithImpl<$Res, _$_HistoryCubitState>
    implements _$$_HistoryCubitStateCopyWith<$Res> {
  __$$_HistoryCubitStateCopyWithImpl(
      _$_HistoryCubitState _value, $Res Function(_$_HistoryCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closeDeals = null,
  }) {
    return _then(_$_HistoryCubitState(
      closeDeals: null == closeDeals
          ? _value._closeDeals
          : closeDeals // ignore: cast_nullable_to_non_nullable
              as List<Deal>,
    ));
  }
}

/// @nodoc

class _$_HistoryCubitState implements _HistoryCubitState {
  _$_HistoryCubitState({final List<Deal> closeDeals = const []})
      : _closeDeals = closeDeals;

  final List<Deal> _closeDeals;
  @override
  @JsonKey()
  List<Deal> get closeDeals {
    if (_closeDeals is EqualUnmodifiableListView) return _closeDeals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_closeDeals);
  }

  @override
  String toString() {
    return 'HistoryCubitState(closeDeals: $closeDeals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryCubitState &&
            const DeepCollectionEquality()
                .equals(other._closeDeals, _closeDeals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_closeDeals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryCubitStateCopyWith<_$_HistoryCubitState> get copyWith =>
      __$$_HistoryCubitStateCopyWithImpl<_$_HistoryCubitState>(
          this, _$identity);
}

abstract class _HistoryCubitState implements HistoryCubitState {
  factory _HistoryCubitState({final List<Deal> closeDeals}) =
      _$_HistoryCubitState;

  @override
  List<Deal> get closeDeals;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryCubitStateCopyWith<_$_HistoryCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
