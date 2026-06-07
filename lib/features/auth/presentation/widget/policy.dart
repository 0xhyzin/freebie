import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: AppColor.p900),
        children: [
          TextSpan(text: "By signing up you agree to our "),
          TextSpan(text: "Terms", style: AppTextStyle.underLine),
          TextSpan(text: ", "),
          TextSpan(text: "Privacy Policy", style: AppTextStyle.underLine),
          TextSpan(text: ", and "),
          TextSpan(text: "Cookie Use", style: AppTextStyle.underLine),
        ],
      ),
    );
  }
}



//"By signing up you agree to our Terms, Privacy Policy, and Cookie Use"