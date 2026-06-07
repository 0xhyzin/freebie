import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/features/auth/presentation/screen/auth_enter_digit_code.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/list_auth_input.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';
import 'package:freebie/features/auth/presentation/util/user_input.dart';
import 'package:freebie/features/auth/presentation/widget/policy.dart';
import 'package:freebie/features/auth/presentation/widget/reset_password.dart';
import 'package:freebie/features/auth/presentation/widget/social_auth.dart';
import 'package:freebie/features/on_branding/presentation/on_branding.dart';

class MainAuthLayout extends StatefulWidget {
  final String title;
  final String subTitle;
  final String buttonTitle;
  final AuthPageType page;
  final bool withSocialLocgin;
  final bool withPolicy;
  final bool withResetPassword;
  const MainAuthLayout({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
    required this.page,
    this.withSocialLocgin = false,
    this.withPolicy = false,
    this.withResetPassword = false,
  });

  @override
  State<MainAuthLayout> createState() => _MainAuthLayoutState();
}

class _MainAuthLayoutState extends State<MainAuthLayout> {
  @override
  void initState() {
    clearAllController();
    _isFullNameValid = false;
    _isEmailValid = false;
    _isPasswordValid = false;
    _isConfirmPasswordValid = false;

    _isFormValid = false;
    super.initState();
  }

  bool _isFullNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isConfirmPasswordValid = false;

  bool _isFormValid = false;

  void makeInputValid(bool value, TypeUserInput type) {
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
      case TypeUserInput.confirmPassword:
        _isConfirmPasswordValid = value;
        break;
    }

    setState(() {
      switch (widget.page) {
        case AuthPageType.singUp:
          _isFormValid =
              (_isFullNameValid && _isEmailValid && _isPasswordValid);
          break;
        case AuthPageType.login:
          _isFormValid = (_isEmailValid && _isPasswordValid);
          break;
        case AuthPageType.forgotPassword:
          _isFormValid = (_isEmailValid);
          break;
        case AuthPageType.enterDigit:
          _isFormValid = true;
          break;
        case AuthPageType.resetPassword:
          _isFormValid = (_isConfirmPasswordValid && _isPasswordValid);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          (widget.page == AuthPageType.forgotPassword ||
              widget.page == AuthPageType.resetPassword ||
              widget.page == AuthPageType.enterDigit)
          ? AppBar()
          : null,
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 20,
          right: 20,
          top:
              (widget.page == AuthPageType.forgotPassword ||
                  widget.page == AuthPageType.resetPassword ||
                  widget.page == AuthPageType.enterDigit)
              ? 0
              : 60,
          bottom: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(top: 10, bottom: 10),
                child: Text(widget.title, style: AppTextStyle.h2sb),
              ),
              Text(widget.subTitle, style: AppTextStyle.b1r),
              SizedBox(height: 10),
              Column(
                children: listInputForEachPage[widget.page]!.map((input) {
                  return UserInput(
                    textLabel: input.label,
                    invokeTypeFunction: input.invokeTypeFunction,
                    hintInput: input.hintText,
                    isValidInput: makeInputValid,
                    inputType: input.typeInput,
                    controller: input.controller,
                    isPassword: input.isPassword,
                  );
                }).toList(),
              ),
              widget.withPolicy ? Policy() : SizedBox(height: 1),
              widget.withResetPassword ? ResetPassword() : SizedBox(height: 1),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isFormValid
                    ? () {
                        print(
                          "=============${listInputForEachPage[widget.page]![0].controller.text}",
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              switch (widget.page) {
                                case AuthPageType.forgotPassword:
                                  return AuthEnterDigitCode(
                                    email: listInputForEachPage[widget.page]![0]
                                        .controller
                                        .text,
                                  );
                                case AuthPageType.singUp:
                                  return AuthEnterDigitCode(
                                    email: listInputForEachPage[widget.page]![1]
                                        .controller
                                        .text,
                                  );
                                default:
                                  return OnBranding();
                              }
                            },
                          ),
                        );
                      }
                    : null,
                child: Text(widget.buttonTitle),
              ),
              widget.withSocialLocgin
                  ? SocialAuth(isSingUp: widget.page == AuthPageType.singUp)
                  : SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
