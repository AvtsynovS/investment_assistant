// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deals_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DealsCubitState {
  List<Deal> get deals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DealsCubitStateCopyWith<DealsCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealsCubitStateCopyWith<$Res> {
  factory $DealsCubitStateCopyWith(
          DealsCubitState value, $Res Function(DealsCubitState) then) =
      _$DealsCubitStateCopyWithImpl<$Res, DealsCubitState>;
  @useResult
  $Res call({List<Deal> deals});
}

/// @nodoc
class _$DealsCubitStateCopyWithImpl<$Res, $Val extends DealsCubitState>
    implements $DealsCubitStateCopyWith<$Res> {
  _$DealsCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deals = null,
  }) {
    return _then(_value.copyWith(
      deals: null == deals
          ? _value.deals
          : deals // ignore: cast_nullable_to_non_nullable
              as List<Deal>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DealsCubitStateCopyWith<$Res>
    implements $DealsCubitStateCopyWith<$Res> {
  factory _$$_DealsCubitStateCopyWith(
          _$_DealsCubitState value, $Res Function(_$_DealsCubitState) then) =
      __$$_DealsCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Deal> deals});
}

/// @nodoc
class __$$_DealsCubitStateCopyWithImpl<$Res>
    extends _$DealsCubitStateCopyWithImpl<$Res, _$_DealsCubitState>
    implements _$$_DealsCubitStateCopyWith<$Res> {
  __$$_DealsCubitStateCopyWithImpl(
      _$_DealsCubitState _value, $Res Function(_$_DealsCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deals = null,
  }) {
    return _then(_$_DealsCubitState(
      deals: null == deals
          ? _value._deals
          : deals // ignore: cast_nullable_to_non_nullable
              as List<Deal>,
    ));
  }
}

/// @nodoc

class _$_DealsCubitState implements _DealsCubitState {
  _$_DealsCubitState({required final List<Deal> deals}) : _deals = deals;

  final List<Deal> _deals;
  @override
  List<Deal> get deals {
    if (_deals is EqualUnmodifiableListView) return _deals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deals);
  }

  @override
  String toString() {
    return 'DealsCubitState(deals: $deals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DealsCubitState &&
            const DeepCollectionEquality().equals(other._deals, _deals));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_deals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DealsCubitStateCopyWith<_$_DealsCubitState> get copyWith =>
      __$$_DealsCubitStateCopyWithImpl<_$_DealsCubitState>(this, _$identity);
}

abstract class _DealsCubitState implements DealsCubitState {
  factory _DealsCubitState({required final List<Deal> deals}) =
      _$_DealsCubitState;

  @override
  List<Deal> get deals;
  @override
  @JsonKey(ignore: true)
  _$$_DealsCubitStateCopyWith<_$_DealsCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
