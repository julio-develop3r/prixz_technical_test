import 'package:app/models/user.dart';
import 'package:app/modules/user_edit/cubit/user_edit_cubit.dart';
import 'package:app/modules/user_info/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'validator.dart';

class UserEditPage extends StatelessWidget {
  const UserEditPage({super.key});

  static const String route = '/user-edit';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserEditCubit>(
      create: (_) => UserEditCubit()..init(),
      child: _View(), //
    );
  }
}

class _View extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserEditCubit, UserEditState>(
      listener: (_, UserEditState state) {
        if (state is UserEditSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User info saved'),
              backgroundColor: Colors.blue, //
            ),
          );
          context.go(UserInfoPage.route);
        }
      },

      builder: (_, UserEditState state) {
        if (state is! UserEditLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: _TextFields(state.userInfo), //
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<UserEditCubit>().saveInfo();
                      } else {
                        context.read<UserEditCubit>().updateAutovalidateMode(
                          AutovalidateMode.always,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TextFields extends StatelessWidget with Validator {
  const _TextFields(this.userInfo);

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          initialValue: userInfo.names,
          validator: validateOnlyLetters,
          decoration: InputDecoration(
            hintText: 'First Name',
            labelText: 'First Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onChanged: (String value) => context.read<UserEditCubit>().updateNames(value),
        ),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: userInfo.lastNames,
          validator: validateOnlyLetters,
          decoration: InputDecoration(
            hintText: 'Last Name',
            labelText: 'Last Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onChanged: (String value) => context.read<UserEditCubit>().updateLastNames(value),
        ),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: userInfo.phone,
          validator: validatePhone,
          decoration: InputDecoration(
            hintText: 'Phone Number',
            labelText: 'Phone Number',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onChanged: (String value) => context.read<UserEditCubit>().updatePhone(value),
        ),

        const SizedBox(height: 16),
        TextFormField(
          initialValue: userInfo.email,
          validator: validateEmail,
          decoration: InputDecoration(
            hintText: 'Email',
            labelText: 'Email',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onChanged: (String value) => context.read<UserEditCubit>().updateEmail(value),
        ),
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            const Text('Birth Date:'),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () async {
                final UserEditCubit cubit = context.read<UserEditCubit>();
                final DateTime now = DateTime.now();
                final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: userInfo.birthDate ?? now,
                  firstDate: DateTime(1900),
                  lastDate: now,
                  locale: const Locale('es', 'ES'),
                );

                if (selectedDate != null) {
                  cubit.updateBirthDate(selectedDate);
                }
              },
              child: const Text('Select Birth Date'),
            ),
          ],
        ),

        if (userInfo.birthDate != null) ...<Widget>[
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Text('${userInfo.birtDateFormated()} - '),
              Text('${userInfo.currentAge()} years old'),
            ],
          ),
        ],

        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            const Text('Gender:'),
            const SizedBox(width: 8),
            DropdownButton<Gender>(
              value: userInfo.gender,
              items: const <DropdownMenuItem<Gender>>[
                DropdownMenuItem<Gender>(value: Gender.male, child: Text('Male')),
                DropdownMenuItem<Gender>(value: Gender.female, child: Text('Female')),
                DropdownMenuItem<Gender>(value: Gender.other, child: Text('Other')),
              ],
              onChanged: (Gender? gender) {
                if (gender != null) {
                  context.read<UserEditCubit>().updateGender(gender);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
