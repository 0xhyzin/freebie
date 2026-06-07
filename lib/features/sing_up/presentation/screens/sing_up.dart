import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/shared/utils/type_user_input.dart';
import 'package:freebie/shared/widgets/button_social_login.dart';
import 'package:freebie/shared/widgets/or_widget.dart';
import 'package:freebie/shared/widgets/user_input.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  bool _isFullNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  bool _isFormValid = false;

  void makeInputValid(TypeUserInput type, bool value) {
    switch (type) {
      case TypeUserInput.fullName:
        _isFullNameValid = value;
        break;
      case TypeUserInput.email:
        _isEmailValid = value;
        break;
      case TypeUserInput.password:
        _isPasswordValid = value;
        break;
    }
    if (_isEmailValid && _isFullNameValid && _isPasswordValid) {
      setState(() {
        _isFormValid = true;
      });
    } else {
      setState(() {
        _isFormValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(top: 70, bottom: 10),
                  child: Text("Create an account", style: AppTextStyle.h2sb),
                ),
                Text("Let’s create your account.", style: AppTextStyle.b1r),
                SizedBox(height: 5),
                UserInput(
                  inputType: TypeUserInput.fullName,
                  textLabel: "Full Name",
                  invokeTypeFunction: validateUserName,
                  hintInput: "Enter your full name",
                  isValidInput: makeInputValid,
                ),
                SizedBox(height: 5),
                UserInput(
                  inputType: TypeUserInput.email,
                  textLabel: "Email",
                  invokeTypeFunction: validateEmail,
                  hintInput: "Enter your email address",
                  isValidInput: makeInputValid,
                ),
                SizedBox(height: 5),
                UserInput(
                  inputType: TypeUserInput.password,
                  textLabel: "Password",
                  invokeTypeFunction: validatePassword,
                  hintInput: "Enter your password",
                  isPassword: true,
                  isValidInput: makeInputValid,
                ),
                SizedBox(height: 10),
                Text(
                  "By signing up you agree to our Terms, Privacy Policy, and Cookie Use",
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isFormValid ? () {} : null,
                  child: Text("Create an Account"),
                ),
                SizedBox(height: 20),
                OrWidget(),
                SizedBox(height: 20),
                ButtonSocialLogin(
                  iconPath: "asset/icon/google.svg",
                  textUsing: "Sign Up with Google",
                  backgroundColor: AppColor.p0,
                  fontColor: AppColor.p900,
                  withIdge: true,
                ),
                SizedBox(height: 20),
                ButtonSocialLogin(
                  iconPath: "asset/icon/facebook.svg",
                  textUsing: "Sign Up with Facebook",
                  backgroundColor: AppColor.facebook,
                  fontColor: AppColor.p0,
                ),
                SizedBox(height: 40),
                Text(
                  "Already have an account? Log In",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
