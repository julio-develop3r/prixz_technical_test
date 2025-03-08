import 'package:app/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_validator_state.dart';

class UserValidatorCubit extends Cubit<UserValidatorState> {
  UserValidatorCubit() : super(const UserValidatorState());

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
      await prefs.setString('userInfo', state.userInfo.toJson().toString());
      print('jalo');
    } catch (e) {
      print(e);
    }
  }
}
