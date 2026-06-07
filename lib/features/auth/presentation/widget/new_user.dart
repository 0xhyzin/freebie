import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/features/auth/presentation/screen/auth_login.dart';
import 'package:freebie/features/auth/presentation/screen/auth_sing_up.dart';

class NewUser extends StatelessWidget {
  const NewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: AppColor.p900),
        children: [
          TextSpan(text: "Don’t have an account? "),
          TextSpan(
            text: "Join",
            style: AppTextStyle.underLine,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => AuthSingUp()),
                );
              },
          ),
        ],
      ),
    );
  }
}


//"Don’t have an account? Join"