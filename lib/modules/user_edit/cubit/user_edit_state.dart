part of 'user_edit_cubit.dart';

sealed class UserEditState extends Equatable {
  const UserEditState();

  @override
  List<Object> get props => <Object>[];
}

final class UserEditLoading extends UserEditState {
  const UserEditLoading();
}

final class UserEditLoaded extends UserEditState {
  const UserEditLoaded({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.userInfo = const UserInfo(),
  });

  final AutovalidateMode autovalidateMode;
  final UserInfo userInfo;

  UserEditLoaded copyWith({AutovalidateMode? autovalidateMode, UserInfo? userInfo}) {
    return UserEditLoaded(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object> get props => <Object>[autovalidateMode, userInfo];
}

final class UserEditSaved extends UserEditState {
  const UserEditSaved();
}
