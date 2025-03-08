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
      await prefs.remove(userInfoKey);
      final String? value = prefs.getString(userInfoKey);
      print('value: $value');
      final Map<String, dynamic> js = json.decode(value ?? '{}');
      print('json: $json');
      emit(UserInfoLoaded(UserInfo.fromJson(js)));
    } catch (e) {
      emit(UserInfoError(e.toString()));
    }
  }
}
