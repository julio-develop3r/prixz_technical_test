import 'package:app/models/user.dart';
import 'package:app/modules/user_edit/user_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/user_info_cubit.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserInfoCubit>(
      create: (_) => UserInfoCubit()..init(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (_, UserInfoState state) {
          if (state is UserInfoError) {
            return Center(child: Text(state.error));
          }

          if (state is! UserInfoLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Expanded(
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('User Info', style: Theme.of(context).textTheme.headlineMedium),
                    ),
                    Text(
                      'Names: ${state.userInfo.names ?? 'N/A'}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Last Names: ${state.userInfo.lastNames ?? 'N/A'}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Phone: ${state.userInfo.phone ?? 'N/A'}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Email: ${state.userInfo.email ?? 'N/A'}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Birth Date: ${_getBirthText(state.userInfo)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Gender: ${state.userInfo.gender ?? 'N/A'}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<String?>(builder: (_) => const UserEditPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Edit'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _getBirthText(UserInfo user) {
    if (user.birthDate == null) {
      return 'N/A';
    }

    return '${user.birtDateFormated()} (${user.currentAge()} years old)';
  }
}
