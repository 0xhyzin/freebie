import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebie/features/auth/presentation/provider/input_state_provider.dart';
import 'package:freebie/features/auth/presentation/screen/auth_enter_digit_code.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/input_type.dart';
import 'package:freebie/features/auth/presentation/util/list_auth_input.dart';
import 'package:freebie/features/auth/presentation/util/or_divider.dart';
import 'package:freebie/features/auth/presentation/util/reset_inputs.dart';
import 'package:freebie/features/auth/presentation/util/user_input.dart';
import 'package:freebie/features/auth/presentation/widget/main_auth_layout.dart';
import 'package:freebie/features/auth/presentation/widget/social_auth.dart';

class AuthSingUp extends ConsumerStatefulWidget {
  const AuthSingUp({super.key});

  @override
  ConsumerState<AuthSingUp> createState() => _AuthSingUpState();
}

class _AuthSingUpState extends ConsumerState<AuthSingUp> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  void onChange() {
    setState(() {
      isValid =
          (listInputForEachPage[AuthPageType.singUp]![0]
              .controller
              .text
              .isNotEmpty &&
          listInputForEachPage[AuthPageType.singUp]![1]
              .controller
              .text
              .isNotEmpty &&
          listInputForEachPage[AuthPageType.singUp]![2]
              .controller
              .text
              .isNotEmpty);
    });
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
                title: "Create an account",
                subTitle: "Let’s create your account.",
                page: AuthPageType.singUp,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: listInputForEachPage[AuthPageType.singUp]!
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
              ElevatedButton(
                onPressed: (isValid)
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          String email =
                              listInputForEachPage[AuthPageType.singUp]![1]
                                  .controller
                                  .text;
                          resetInputs(ref, _formKey);

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AuthEnterDigitCode(
                                email: email,
                                isSingUp: true,
                              ),
                            ),
                            (r) => false,
                          );
                        }
                      }
                    : null,
                child: Text("Sing Up"),
              ),
              SocialAuth(isSingUp: true),
            ],
          ),
        ),
      ),
    );
  }
}
