import 'dart:convert';

import 'package:app/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_edit_state.dart';

class UserEditCubit extends Cubit<UserEditState> {
  UserEditCubit() : super(const UserEditLoading());

  Future<void> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final String? value = prefs.getString(userInfoKey);
      final Map<String, dynamic> json = jsonDecode(value ?? '{}');
      emit(UserEditLoaded(userInfo: UserInfo.fromJson(json)));
    } catch (e) {
      emit(const UserEditLoaded());
    }
  }

  void updateNames(String value) {
    final UserEditLoaded st = state as UserEditLoaded;
    emit(st.copyWith(userInfo: st.userInfo.copyWith(names: value)));
  }

  void updateLastNames(String value) {
    final UserEditLoaded st = state as UserEditLoaded;
    emit(st.copyWith(userInfo: st.userInfo.copyWith(lastNames: value)));
  }

  void updatePhone(String value) {
    final UserEditLoaded st = state as UserEditLoaded;
    emit(st.copyWith(userInfo: st.userInfo.copyWith(phone: value)));
  }

  void updateEmail(String value) {
    final UserEditLoaded st = state as UserEditLoaded;
    emit(st.copyWith(userInfo: st.userInfo.copyWith(email: value)));
  }

  void updateBirthDate(DateTime date) {
    final UserEditLoaded st = state as UserEditLoaded;
    emit(st.copyWith(userInfo: st.userInfo.copyWith(birthDate: date)));
  }

  void updateGender(Gender gender) {
    final UserEditLoaded st = state as UserEditLoaded;
    emit(st.copyWith(userInfo: st.userInfo.copyWith(gender: gender)));
  }

  void updateAutovalidateMode(AutovalidateMode? autovalidateMode) {
    final UserEditLoaded st = state as UserEditLoaded;
    emit(st.copyWith(autovalidateMode: autovalidateMode));
  }

  Future<void> saveInfo() async {
    final UserEditLoaded st = state as UserEditLoaded;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      emit(const UserEditLoading());
      final Map<String, dynamic> json = st.userInfo.toJson();
      await prefs.setString(userInfoKey, jsonEncode(json));
      emit(const UserEditSaved());
    } catch (e) {
      print(e);
    }
  }
}
