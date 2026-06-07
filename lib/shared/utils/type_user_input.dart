import 'package:email_validator/email_validator.dart';

enum TypeUserInput { fullName, email, password }

String? validateEmail(String? email) {
  sharedValidate(email, "Please enter  email address");
  if (!EmailValidator.validate(email!)) {
    return "Please enter valid email address";
  }
  return null;
}

String? validateUserName(String? userName) {
  sharedValidate(userName, "Please enter userName");
  if (userName!.length < 2) {
    return "Please Enter User Name";
  }
  return null;
}

String? validatePassword(String? password) {
  sharedValidate(password, "Please enter Password");
  if (password!.length < 6) {
    return "Please Enter Strong Password";
  }
  return null;
}

String? sharedValidate(String? value, String message) {
  if (value == null || value.isEmpty) {
    return message;
  } else {
    return null;
  }
}
