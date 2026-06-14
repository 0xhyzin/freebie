import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/input_type.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';

InputType fullName = InputType(
  "Full Name",
  "Enter your full name",
  false,
  TypeUserInput.fullName,
  validateUserName,
);
InputType email = InputType(
  "Email",
  "Enter your email address",
  false,
  TypeUserInput.email,
  validateEmail,
);
InputType password = InputType(
  "Password",
  "Enter your password",
  true,
  TypeUserInput.password,
  validatePassword,
);
InputType confirmPassword = InputType(
  "Confirm Password",
  "Enter your Confirm password",
  true,
  TypeUserInput.password,
  validatePassword,
);
InputType digit1 = InputType(
  "",
  "",
  false,
  TypeUserInput.digit,
  validatePassword,
);
InputType digit2 = InputType(
  "",
  "",
  false,
  TypeUserInput.digit,
  validatePassword,
);
InputType digit3 = InputType(
  "",
  "",
  false,
  TypeUserInput.digit,
  validatePassword,
);
InputType digit4 = InputType(
  "",
  "",
  false,
  TypeUserInput.digit,
  validatePassword,
);
void clearAllController() {
  listInputForEachPage.forEach((page, inputs) {
    for (var input in inputs) {
      input.controller.clear();
    }
  });
}

Map<AuthPageType, List<InputType>> listInputForEachPage = {
  AuthPageType.singUp: [fullName, email, password],
  AuthPageType.login: [email, password],
  AuthPageType.forgotPassword: [email],
  AuthPageType.resetPassword: [password, confirmPassword],
  AuthPageType.enterDigit: [digit1, digit2, digit3, digit4],
};
