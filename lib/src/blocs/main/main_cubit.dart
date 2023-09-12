import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainCubitState> {
  MainCubit()
      : super(const MainCubitState(
          avatar: AssetImage('assets/images/defaultPerson.jpg'),
        ));

  void changeTheme(bool value) {
    emit(state.copyWith(isDarkMode: value));
  }

  Future getAvatar() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final avatar = File(image.path);
    emit(state.copyWith(avatar: Image.file(avatar).image));
  }
}
