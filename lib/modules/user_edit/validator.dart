mixin Validator {
  String? validateOnlyLetters(String? value) {
    final RegExp regExp = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$');

    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    } else if (!regExp.hasMatch(value)) {
      return 'Only letters, accents, and spaces are allowed';
    }

    return null;
  }

  String? validatePhone(String? value) {
    final RegExp regExp = RegExp(r'^\d{10}$');

    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Phone number must contain exactly 10 digits';
    }

    return null;
  }

  String? validateEmail(String? value) {
    final RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }
}
