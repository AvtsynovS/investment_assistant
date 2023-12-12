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
// final String? avatar,
  ImageProvider<Object>? get avatar => throw _privateConstructorUsedError;
  bool get isDarkMode => throw _privateConstructorUsedError;
  String? get locale => throw _privateConstructorUsedError;

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
  $Res call({ImageProvider<Object>? avatar, bool isDarkMode, String? locale});
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
    Object? avatar = freezed,
    Object? isDarkMode = null,
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({ImageProvider<Object>? avatar, bool isDarkMode, String? locale});
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
    Object? avatar = freezed,
    Object? isDarkMode = null,
    Object? locale = freezed,
  }) {
    return _then(_$_MainCubitState(
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MainCubitState implements _MainCubitState {
  const _$_MainCubitState({this.avatar, this.isDarkMode = false, this.locale});

// final String? avatar,
  @override
  final ImageProvider<Object>? avatar;
  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  final String? locale;

  @override
  String toString() {
    return 'MainCubitState(avatar: $avatar, isDarkMode: $isDarkMode, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainCubitState &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, avatar, isDarkMode, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainCubitStateCopyWith<_$_MainCubitState> get copyWith =>
      __$$_MainCubitStateCopyWithImpl<_$_MainCubitState>(this, _$identity);
}

abstract class _MainCubitState implements MainCubitState {
  const factory _MainCubitState(
      {final ImageProvider<Object>? avatar,
      final bool isDarkMode,
      final String? locale}) = _$_MainCubitState;

  @override // final String? avatar,
  ImageProvider<Object>? get avatar;
  @override
  bool get isDarkMode;
  @override
  String? get locale;
  @override
  @JsonKey(ignore: true)
  _$$_MainCubitStateCopyWith<_$_MainCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
