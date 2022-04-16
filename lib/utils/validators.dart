class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static isValidEmail(String email) {
    if ((email.isEmpty) ||
        ((email.isNotEmpty) &&
            ((email.contains('.')) && (email.contains('@'))))) {
      return true;
    } else {
      return false;
    }
    // return _emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  static bool isValidFirstName(String firstName) {
    if (firstName.length < 3 && firstName.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool isValidLastName(String lastName) {
    if (lastName.length < 3 && lastName.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool isValidPhone(String phone) {
    if (phone.isNotEmpty && phone.length < 11) {
      return false;
    } else {
      return true;
    }
  }
}
