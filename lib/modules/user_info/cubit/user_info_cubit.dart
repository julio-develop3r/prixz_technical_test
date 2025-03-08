import 'dart:convert';

import 'package:app/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoLoading());

  Future<void> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final String? value = prefs.getString(userInfoKey);
      final Map<String, dynamic> json = jsonDecode(value ?? '{}');
      emit(UserInfoLoaded(UserInfo.fromJson(json)));
    } catch (e) {
      emit(UserInfoError(e.toString()));
    }
  }
}
