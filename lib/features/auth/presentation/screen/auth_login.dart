import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/list_auth_input.dart';
import 'package:freebie/features/auth/presentation/util/user_input.dart';
import 'package:freebie/features/auth/presentation/widget/main_auth_layout.dart';
import 'package:freebie/features/auth/presentation/widget/reset_password.dart';
import 'package:freebie/features/auth/presentation/widget/social_auth.dart';

class AuthLogin extends StatefulWidget {
  const AuthLogin({super.key});

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  void onChange() {
    setState(() {
      isValid =
          (listInputForEachPage[AuthPageType.login]![0]
              .controller
              .text
              .isNotEmpty &&
          listInputForEachPage[AuthPageType.login]![1]
              .controller
              .text
              .isNotEmpty);
    });
  }

  @override
  void initState() {
    clearAllController();
    isValid = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 20,
          right: 20,
          top: 60,
          bottom: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MainAuthLayout(
                title: "Login to your account",
                subTitle: "It’s great to see you again.",
                page: AuthPageType.login,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: listInputForEachPage[AuthPageType.login]!
                      .map(
                        (i) => UserInput(
                          typeInput: i.typeInput,
                          textLabel: i.label,
                          hintInput: i.hintText,
                          invokeTypeFunction: i.invokeTypeFunction,
                          controller: i.controller,
                          isPassword: i.isPassword,
                          onChangeInput: onChange,
                        ),
                      )
                      .toList(),
                ),
              ),
              ResetPassword(),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: (isValid)
                    ? () {
                        _formKey.currentState!.validate();
                      }
                    : null,
                child: Text("Login"),
              ),
              SocialAuth(isSingUp: false),
            ],
          ),
        ),
      ),
    );
  }
}
