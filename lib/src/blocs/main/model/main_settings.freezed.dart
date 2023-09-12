// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainSettings {
  ImageProvider<Object>? get avatar => throw _privateConstructorUsedError;
  bool get isDarkMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainSettingsCopyWith<MainSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainSettingsCopyWith<$Res> {
  factory $MainSettingsCopyWith(
          MainSettings value, $Res Function(MainSettings) then) =
      _$MainSettingsCopyWithImpl<$Res, MainSettings>;
  @useResult
  $Res call({ImageProvider<Object>? avatar, bool isDarkMode});
}

/// @nodoc
class _$MainSettingsCopyWithImpl<$Res, $Val extends MainSettings>
    implements $MainSettingsCopyWith<$Res> {
  _$MainSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = freezed,
    Object? isDarkMode = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainSettingsCopyWith<$Res>
    implements $MainSettingsCopyWith<$Res> {
  factory _$$_MainSettingsCopyWith(
          _$_MainSettings value, $Res Function(_$_MainSettings) then) =
      __$$_MainSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageProvider<Object>? avatar, bool isDarkMode});
}

/// @nodoc
class __$$_MainSettingsCopyWithImpl<$Res>
    extends _$MainSettingsCopyWithImpl<$Res, _$_MainSettings>
    implements _$$_MainSettingsCopyWith<$Res> {
  __$$_MainSettingsCopyWithImpl(
      _$_MainSettings _value, $Res Function(_$_MainSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = freezed,
    Object? isDarkMode = null,
  }) {
    return _then(_$_MainSettings(
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MainSettings implements _MainSettings {
  const _$_MainSettings({this.avatar, this.isDarkMode = false});

  @override
  final ImageProvider<Object>? avatar;
  @override
  @JsonKey()
  final bool isDarkMode;

  @override
  String toString() {
    return 'MainSettings(avatar: $avatar, isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainSettings &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, avatar, isDarkMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainSettingsCopyWith<_$_MainSettings> get copyWith =>
      __$$_MainSettingsCopyWithImpl<_$_MainSettings>(this, _$identity);
}

abstract class _MainSettings implements MainSettings {
  const factory _MainSettings(
      {final ImageProvider<Object>? avatar,
      final bool isDarkMode}) = _$_MainSettings;

  @override
  ImageProvider<Object>? get avatar;
  @override
  bool get isDarkMode;
  @override
  @JsonKey(ignore: true)
  _$$_MainSettingsCopyWith<_$_MainSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
