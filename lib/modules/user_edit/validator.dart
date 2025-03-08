mixin Validator {
  String? validateNoEmpty(String? value) {
    final String v = value?.trim() ?? '';

    if (v.isEmpty) {
      return 'enter_valid_value';
    }

    return null;
  }

  // String? validateEmail(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Email is required';
  //   } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
  //     return 'Please enter a valid email';
  //   }
  //   return null;
  // }

  // String? validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Password is required';
  //   } else if (value.length < 6) {
  //     return 'Password must be at least 6 characters';
  //   }
  //   return null;
  // }

  // Confirm password validation
  // String? validateConfirmPassword(String? value, String password) {
  //   if (value == null || value.isEmpty) {
  //     return 'Confirm password is required';
  //   } else if (value != password) {
  //     return 'Confirm password does not match';
  //   }
  //   return null;
  // }
}
