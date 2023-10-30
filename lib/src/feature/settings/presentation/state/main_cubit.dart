import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/secure_storag_model.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/storage_keys.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainCubitState> {
  MainCubit()
      : super(const MainCubitState(
          avatar: AssetImage('assets/images/defaultPerson.jpg'),
        ));

  String settingsBoxTitle = 'settings';

  MainCubitState initState() {
    emit(state);
    return state;
  }

  getSecureKey() async {
    const secureStorage = FlutterSecureStorage();
    final key = await secureStorage.read(key: StorageKeys.boxKey);
    final encryptionKeyUint8List = base64Url.decode(key!);

    return encryptionKeyUint8List;
  }

  void initAvatar() async {
    final encryptionKeyUint8List = await getSecureKey();
    var box = await Hive.openBox(settingsBoxTitle,
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));

    final String img64 = await box.get('avatar');
    Uint8List avatar = base64.decode(img64);

    emit(state.copyWith(avatar: MemoryImage(avatar)));
  }

  void changeTheme(bool value) async {
    final encryptionKeyUint8List = await getSecureKey();

    var box = await Hive.openBox(settingsBoxTitle,
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    box.put('isDarkMode', value).then((value) => initState());

    emit(state.copyWith(isDarkMode: value));
  }

  Future setAvatar() async {
    final encryptionKeyUint8List = await getSecureKey();
    var box = await Hive.openBox(settingsBoxTitle,
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final bytes = File(image.path).readAsBytesSync();
    String img64 = base64Encode(bytes);

    final File avatar = File(image.path);
    box.put('avatar', img64).then((value) => initAvatar());
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
