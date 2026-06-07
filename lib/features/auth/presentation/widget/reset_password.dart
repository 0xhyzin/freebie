import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/features/auth/presentation/screen/auth_forgot_password.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: AppColor.p900),
        children: [
          TextSpan(text: "Forgot your password? "),
          TextSpan(
            text: "Reset your password",
            style: AppTextStyle.underLine,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AuthForgotPassword()),
                );
              },
          ),
        ],
      ),
    );
  }
}


//"Forgot your password? Reset your password"