import 'package:app/models/user.dart';
import 'package:app/modules/user_edit/cubit/user_edit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'validator.dart';

class UserEditPage extends StatelessWidget {
  const UserEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserEditCubit>(create: (_) => UserEditCubit(), child: _View());
  }
}

class _View extends StatelessWidget with Validator {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final UserEditCubit cubit = context.read<UserEditCubit>();

    return BlocBuilder<UserEditCubit, UserEditState>(
      builder: (_, UserEditState state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: validateNoEmpty,
                          decoration: InputDecoration(
                            hintText: 'Names',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          onChanged: (String value) => cubit.updateNames(value),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          validator: validateNoEmpty,
                          decoration: InputDecoration(
                            hintText: 'LastNames',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          onChanged: (String value) => cubit.updateLastNames(value),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          validator: validateNoEmpty,
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          onChanged: (String value) => cubit.updatePhone(value),
                        ),

                        const SizedBox(height: 8),
                        TextFormField(
                          validator: validateNoEmpty,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          onChanged: (String value) => cubit.updateEmail(value),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: <Widget>[
                            const Text('BirthDate:'),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () async {
                                final DateTime now = DateTime.now();
                                final DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: state.userInfo.birthDate ?? now,
                                  firstDate: DateTime(1900),
                                  lastDate: now,
                                  locale: const Locale('es', 'ES'),
                                );

                                if (selectedDate != null) {
                                  cubit.updateBirthDate(selectedDate);
                                }
                              },
                              child: const Text('Select date'),
                            ),
                          ],
                        ),

                        if (state.userInfo.birthDate != null) ...<Widget>[
                          const SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              Text('${state.userInfo.birtDateFormated()} - '),
                              Text('${state.userInfo.currentAge()} years old'),
                            ],
                          ),
                        ],

                        const SizedBox(height: 8),
                        Row(
                          children: <Widget>[
                            const Text('Gender:'),
                            const SizedBox(width: 8),
                            DropdownButton<Gender>(
                              value: state.userInfo.gender,
                              items: const <DropdownMenuItem<Gender>>[
                                DropdownMenuItem<Gender>(value: Gender.male, child: Text('Male')),
                                DropdownMenuItem<Gender>(
                                  value: Gender.female,
                                  child: Text('Female'),
                                ),
                                DropdownMenuItem<Gender>(value: Gender.other, child: Text('Other')),
                              ],
                              onChanged: (Gender? gender) {
                                if (gender != null) {
                                  cubit.updateGender(gender);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
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
