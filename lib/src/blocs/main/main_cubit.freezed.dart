// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainCubitState {
  bool get isSwitched => throw _privateConstructorUsedError;
  ImageProvider<Object>? get avatar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainCubitStateCopyWith<MainCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainCubitStateCopyWith<$Res> {
  factory $MainCubitStateCopyWith(
          MainCubitState value, $Res Function(MainCubitState) then) =
      _$MainCubitStateCopyWithImpl<$Res, MainCubitState>;
  @useResult
  $Res call({bool isSwitched, ImageProvider<Object>? avatar});
}

/// @nodoc
class _$MainCubitStateCopyWithImpl<$Res, $Val extends MainCubitState>
    implements $MainCubitStateCopyWith<$Res> {
  _$MainCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSwitched = null,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      isSwitched: null == isSwitched
          ? _value.isSwitched
          : isSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainCubitStateCopyWith<$Res>
    implements $MainCubitStateCopyWith<$Res> {
  factory _$$_MainCubitStateCopyWith(
          _$_MainCubitState value, $Res Function(_$_MainCubitState) then) =
      __$$_MainCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSwitched, ImageProvider<Object>? avatar});
}

/// @nodoc
class __$$_MainCubitStateCopyWithImpl<$Res>
    extends _$MainCubitStateCopyWithImpl<$Res, _$_MainCubitState>
    implements _$$_MainCubitStateCopyWith<$Res> {
  __$$_MainCubitStateCopyWithImpl(
      _$_MainCubitState _value, $Res Function(_$_MainCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSwitched = null,
    Object? avatar = freezed,
  }) {
    return _then(_$_MainCubitState(
      isSwitched: null == isSwitched
          ? _value.isSwitched
          : isSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
    ));
  }
}

/// @nodoc

class _$_MainCubitState implements _MainCubitState {
  const _$_MainCubitState({required this.isSwitched, this.avatar});

  @override
  final bool isSwitched;
  @override
  final ImageProvider<Object>? avatar;

  @override
  String toString() {
    return 'MainCubitState(isSwitched: $isSwitched, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainCubitState &&
            (identical(other.isSwitched, isSwitched) ||
                other.isSwitched == isSwitched) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSwitched, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainCubitStateCopyWith<_$_MainCubitState> get copyWith =>
      __$$_MainCubitStateCopyWithImpl<_$_MainCubitState>(this, _$identity);
}

abstract class _MainCubitState implements MainCubitState {
  const factory _MainCubitState(
      {required final bool isSwitched,
      final ImageProvider<Object>? avatar}) = _$_MainCubitState;

  @override
  bool get isSwitched;
  @override
  ImageProvider<Object>? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_MainCubitStateCopyWith<_$_MainCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
