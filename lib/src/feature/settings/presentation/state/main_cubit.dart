import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investment_assistant/src/feature/settings/domain/models/main_settings_model.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/secure_storag_model.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/storage_keys.dart';
import 'package:investment_assistant/src/localizations/l10n/all_locales.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainCubitState> {
  MainCubit()
      : super(const MainCubitState(
          avatar: AssetImage('assets/images/defaultPerson.jpg'),
          isDarkMode: true,
        ));

  String settingsBoxTitle = 'settings';
  List<String>? keys = [];
  final settingsBox = Hive.box<MainSettings>("settings");

  MainCubitState initState() {
    emit(state);
    return state;
  }

  initSettings() async {
    settingsBox.toMap().forEach((key, value) {
      switch (key) {
        case 'isDarkMode':
          emit(state.copyWith(isDarkMode: value.isDarkMode));
        case 'locale':
          emit(state.copyWith(locale: value.locale));
        case 'avatar':
          () async {
            final image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (image == null) return;

            Uint8List avatar = File(image.path).readAsBytesSync();
            emit(state.copyWith(avatar: MemoryImage(avatar)));
          };
      }
    });
    initState();
  }

  setDefaultSettings() {
    settingsBox.put('isDarkMode', MainSettings(isDarkMode: false));
    settingsBox.put(
        'locale', MainSettings(locale: AllLocale.all[0].languageCode));
    settingsBox.put('avatar', MainSettings(avatar: null));

    emit(state.copyWith(
      isDarkMode: false,
      locale: AllLocale.all[0].languageCode,
      avatar: const AssetImage('assets/images/defaultPerson.jpg'),
    ));
  }

  void initAvatar() async {
    final img64 = settingsBox.get('avatar');

    if (img64 != null && img64.avatar != null) {
      Uint8List avatar = base64.decode(img64.avatar!);
      emit(state.copyWith(avatar: MemoryImage(avatar)));
    }
  }

  void changeTheme(bool value) async {
    settingsBox
        .put('isDarkMode', MainSettings(isDarkMode: value))
        .then((value) => initState());

    emit(state.copyWith(isDarkMode: value));
  }

  Future setAvatar() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final bytes = File(image.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    final File avatar = File(image.path);

    settingsBox
        .put('avatar', MainSettings(avatar: img64))
        .then((value) => initAvatar());
    emit(state.copyWith(avatar: Image.file(avatar).image));
  }

  Future<bool> checkCurrentPassword(String currentPassword) async {
    final securePassword = await SecureStoragModel().readPassword();

    if (securePassword != currentPassword) {
      return false;
    }
    return true;
  }

  void changePassword(String newPassword) async {
    await SecureStoragModel().setPassword(newPassword);
    await SecureStoragModel().readPassword();
  }

  Future<bool> checkCurrentLogin(String currentLogin) async {
    final secureLogin = await SecureStoragModel().readLogin();

    if (secureLogin != currentLogin) {
      return false;
    }
    return true;
  }

  void changeLogin(String newLogin) async {
    await SecureStoragModel().setLogin(newLogin);
    await SecureStoragModel().readLogin();
  }

  Future readSecureLogin() async {
    const secureStorage = FlutterSecureStorage();
    String? login = await secureStorage.read(key: StorageKeys.login);
    if (login != null) {
      return login.toString();
    }
  }
}
