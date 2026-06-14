import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebie/features/auth/presentation/provider/input_state_provider.dart';
import 'package:freebie/features/auth/presentation/screen/auth_enter_digit_code.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/input_type.dart';
import 'package:freebie/features/auth/presentation/util/list_auth_input.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';
import 'package:freebie/features/auth/presentation/util/user_input.dart';
import 'package:freebie/features/auth/presentation/widget/main_auth_layout.dart';
import 'package:freebie/features/auth/presentation/widget/social_auth.dart';

class AuthForgotPassword extends ConsumerStatefulWidget {
  const AuthForgotPassword({super.key});

  @override
  ConsumerState<AuthForgotPassword> createState() => _AuthForgotPasswordState();
}

class _AuthForgotPasswordState extends ConsumerState<AuthForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  void onChange() {
    setState(() {
      isValid = (listInputForEachPage[AuthPageType.login]![0]
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
      appBar: AppBar(toolbarHeight: 60),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 20,
          right: 20,
          top: 0,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainAuthLayout(
              title: "Forgot password",
              subTitle:
                  "Enter your email for the verification process. We will send 4 digits code to your email.",
              page: AuthPageType.forgotPassword,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: listInputForEachPage[AuthPageType.forgotPassword]!
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
            SizedBox(height: 20),
            Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: (isValid)
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AuthEnterDigitCode(
                              email:
                                  listInputForEachPage[AuthPageType.singUp]![1]
                                      .controller
                                      .text,
                            ),
                          ),
                        ).then((_) {
                          for (InputType inputType
                              in listInputForEachPage[AuthPageType.singUp]!) {
                            ref
                                .read(
                                  inputProviderNotifier(
                                    inputType.typeInput,
                                  ).notifier,
                                )
                                .makeInputValid(false);
                            ref
                                .read(
                                  inputFirstProviderNotifier(
                                    inputType.typeInput,
                                  ).notifier,
                                )
                                .makeInputValid(false);
                          }
                          _formKey.currentState!.reset();
                          clearAllController();
                        });
                      }
                    }
                  : null,
              child: Text("Send Code"),
            ),
          ],
        ),
      ),
    );
  }
}


//MainAuthLayout(
 //     title: "Forgot password",
  //    subTitle:
   //       "Enter your email for the verification process. We will send 4 digits code to your email.",
    //  page: AuthPageType.forgotPassword,
   // );