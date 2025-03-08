import 'dart:convert';

import 'package:app/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_edit_state.dart';

class UserEditCubit extends Cubit<UserEditState> {
  UserEditCubit() : super(const UserEditState());

  void updateNames(String value) {
    emit(state.copyWith(userInfo: state.userInfo.copyWith(names: value)));
  }

  void updateLastNames(String value) {
    emit(state.copyWith(userInfo: state.userInfo.copyWith(lastNames: value)));
  }

  void updatePhone(String value) {
    emit(state.copyWith(userInfo: state.userInfo.copyWith(phone: value)));
  }

  void updateEmail(String value) {
    emit(state.copyWith(userInfo: state.userInfo.copyWith(email: value)));
  }

  void updateBirthDate(DateTime date) {
    emit(state.copyWith(userInfo: state.userInfo.copyWith(birthDate: date)));
  }

  void updateGender(Gender gender) {
    emit(state.copyWith(userInfo: state.userInfo.copyWith(gender: gender)));
  }

  void updateAutovalidateMode(AutovalidateMode? autovalidateMode) {
    emit(state.copyWith(autovalidateMode: autovalidateMode));
  }

  Future<void> saveInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final Map<String, dynamic> json = state.userInfo.toJson();

      await prefs.setString(userInfoKey, jsonEncode(json));
      print('jalo');
    } catch (e) {
      print(e);
    }
  }
}
