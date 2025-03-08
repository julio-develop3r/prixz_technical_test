part of 'user_info_cubit.dart';

sealed class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

final class UserInfoLoading extends UserInfoState {}

final class UserInfoLoaded extends UserInfoState {
  const UserInfoLoaded(this.userInfo);

  final UserInfo userInfo;
}

final class UserInfoError extends UserInfoState {
  const UserInfoError(this.error);

  final String error;
}
