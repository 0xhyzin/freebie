import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/features/auth/presentation/screen/auth_enter_digit_code.dart';
import 'package:freebie/features/auth/presentation/screen/auth_login.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/input_type.dart';
import 'package:freebie/features/auth/presentation/util/list_auth_input.dart';
import 'package:freebie/features/auth/presentation/util/reset_inputs.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';
import 'package:freebie/features/auth/presentation/util/user_input.dart';
import 'package:freebie/features/auth/presentation/widget/main_auth_layout.dart';
import 'package:freebie/shared/widgets/dialog_done.dart';

class AuthEnterNewPassowrd extends ConsumerStatefulWidget {
  const AuthEnterNewPassowrd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthEnterNewPassowrdState();
}

class _AuthEnterNewPassowrdState extends ConsumerState<AuthEnterNewPassowrd> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  void onChange() {
    setState(() {
      isValid =
          (listInputForEachPage[AuthPageType.resetPassword]![0]
              .controller
              .text
              .isNotEmpty &&
          listInputForEachPage[AuthPageType.resetPassword]![1]
              .controller
              .text
              .isNotEmpty);
    });
  }

  String? isValidPassowrd() {
    return validateConfirmPassword(
      listInputForEachPage[AuthPageType.resetPassword]![0].controller.text,
      listInputForEachPage[AuthPageType.resetPassword]![1].controller.text,
    );
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
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainAuthLayout(
              title: "Reset Password",
              subTitle:
                  "Set the new password for your account so you can login and access all the features.",
              page: AuthPageType.forgotPassword,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: listInputForEachPage[AuthPageType.resetPassword]!
                    .map(
                      (i) => UserInput(
                        typeInput: i.typeInput,
                        textLabel: i.label,
                        hintInput: i.hintText,
                        invokeTypeFunction: i.invokeTypeFunction,
                        controller: i.controller,
                        isPassword: i.isPassword,
                        isConfirmPassword: i.isConfirmPassword,
                        onChangeInput: onChange,
                        isValidConfirmPassword: isValidPassowrd,
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: (isValid)
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        resetInputs(ref, _formKey);
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: DialogDone(
                              title: "Password Changed!",
                              message:
                                  "Your can now use your new password to login to your account.",
                              buttonTitle: "Login",
                              buttonFunction: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AuthLogin(),
                                  ),
                                ).then((_) {
                                  resetInputs(ref, _formKey);
                                });
                              },
                            ),
                          ),
                        );
                      }
                    }
                  : null,
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
