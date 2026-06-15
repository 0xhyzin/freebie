import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/input_type.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';

InputType fullName = InputType(
  label: "Full Name",
  hintText: "Enter your full name",
  typeInput: TypeUserInput.fullName,
  invokeTypeFunction: validateUserName,
);

InputType email = InputType(
  label: "Email",
  hintText: "Enter your email address",
  typeInput: TypeUserInput.email,
  invokeTypeFunction: validateEmail,
);

InputType password = InputType(
  label: "Password",
  hintText: "Enter your password",
  isPassword: true,
  typeInput: TypeUserInput.password,
  invokeTypeFunction: validatePassword,
);

InputType confirmPassword = InputType(
  label: "Confirm Password",
  hintText: "Enter your Confirm password",
  isConfirmPassword: true,
  isPassword: true,
  typeInput: TypeUserInput.confirmPassword,
  invokeTypeFunction: validatePassword,
);

InputType digit1 = InputType(typeInput: TypeUserInput.digit);
InputType digit2 = InputType(typeInput: TypeUserInput.digit);
InputType digit3 = InputType(typeInput: TypeUserInput.digit);
InputType digit4 = InputType(typeInput: TypeUserInput.digit);

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
  AuthPageType.allScreens: [
    fullName,
    email,
    password,
    confirmPassword,
    digit1,
    digit2,
    digit3,
    digit4,
  ],
};
