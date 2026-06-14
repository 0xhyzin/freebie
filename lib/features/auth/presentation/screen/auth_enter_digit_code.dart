import 'package:flutter/material.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/digit_input.dart';
import 'package:freebie/features/auth/presentation/util/list_auth_input.dart';
import 'package:freebie/features/auth/presentation/util/user_input.dart';
import 'package:freebie/features/auth/presentation/widget/main_auth_layout.dart';

class AuthEnterDigitCode extends StatefulWidget {
  final String email;
  const AuthEnterDigitCode({super.key, required this.email});

  @override
  State<AuthEnterDigitCode> createState() => _AuthEnterDigitCodeState();
}

class _AuthEnterDigitCodeState extends State<AuthEnterDigitCode> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  void onChange() {
    setState(() {
      isValid =
          (listInputForEachPage[AuthPageType.enterDigit]![0]
              .controller
              .text
              .isNotEmpty &&
          listInputForEachPage[AuthPageType.enterDigit]![1]
              .controller
              .text
              .isNotEmpty &&
          listInputForEachPage[AuthPageType.enterDigit]![2]
              .controller
              .text
              .isNotEmpty &&
          listInputForEachPage[AuthPageType.enterDigit]![3]
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
              title: "Enter 4 Digit Code",
              email: widget.email,
              subTitle: "Enter 4 digit code that your receive on your email.",
              page: AuthPageType.enterDigit,
            ),
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: listInputForEachPage[AuthPageType.enterDigit]!
                    .map(
                      (i) => DigitInput(
                        controller: i.controller,
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
                      _formKey.currentState!.validate();
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
