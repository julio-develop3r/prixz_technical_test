part of 'user_edit_cubit.dart';

final class UserEditState {
  const UserEditState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.userInfo = const UserInfo(),
  });

  final AutovalidateMode autovalidateMode;
  final UserInfo userInfo;

  UserEditState copyWith({AutovalidateMode? autovalidateMode, UserInfo? userInfo}) {
    return UserEditState(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}
