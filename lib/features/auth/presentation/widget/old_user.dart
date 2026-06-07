import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/features/auth/presentation/screen/auth_login.dart';
import 'package:freebie/features/auth/presentation/screen/auth_sing_up.dart';

class OldUser extends StatelessWidget {
  const OldUser({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: AppColor.p900),
        children: [
          TextSpan(text: "Already have an account?  "),
          TextSpan(
            text: "Log In",
            style: AppTextStyle.underLine,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => AuthLogin()),
                );
              },
          ),
        ],
      ),
    );
  }
}


//"Already have an account? Log In"