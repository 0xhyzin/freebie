import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/features/auth/presentation/screen/auth_enter_digit_code.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/list_auth_input.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';
import 'package:freebie/features/auth/presentation/util/user_input.dart';
import 'package:freebie/features/auth/presentation/widget/enter_digit.dart';
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
  final String email;
  const MainAuthLayout({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
    required this.page,
    this.email = "",
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

    _isFormValid = false;
    super.initState();
  }

  void isFormValid() {
    setState(() {
      _isFormValid = _formKey.currentState!.validate();
    });
  }

  bool _isFormValid = false;

  final _formKey = GlobalKey<FormState>();

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

              widget.page == AuthPageType.enterDigit
                  ? RichText(
                      text: TextSpan(
                        style: AppTextStyle.b1WithColor,
                        children: [
                          TextSpan(text: widget.subTitle),
                          TextSpan(
                            text: "(${widget.email})",
                            style: AppTextStyle.email,
                          ),
                        ],
                      ),
                    )
                  : Text(widget.subTitle, style: AppTextStyle.b1r),
              SizedBox(height: 10),
              widget.page == AuthPageType.enterDigit
                  ? EnterDigit()
                  : Form(
                      key: _formKey,
                      child: Column(
                        children: listInputForEachPage[widget.page]!.map((
                          input,
                        ) {
                          return UserInput(
                            textLabel: input.label,
                            invokeTypeFunction: input.invokeTypeFunction,
                            hintInput: input.hintText,
                            checkIsValid: isFormValid,
                            inputType: input.typeInput,
                            controller: input.controller,
                            isPassword: input.isPassword,
                          );
                        }).toList(),
                      ),
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
