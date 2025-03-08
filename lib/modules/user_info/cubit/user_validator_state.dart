part of 'user_validator_cubit.dart';

final class UserValidatorState {
  const UserValidatorState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.userInfo = const UserInfo(),
  });

  final AutovalidateMode autovalidateMode;
  final UserInfo userInfo;

  UserValidatorState copyWith({AutovalidateMode? autovalidateMode, UserInfo? userInfo}) {
    return UserValidatorState(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}
