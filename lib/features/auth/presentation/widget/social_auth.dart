import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/features/auth/presentation/util/social_button.dart';
import 'package:freebie/features/auth/presentation/util/or_divider.dart';
import 'package:freebie/features/auth/presentation/widget/new_user.dart';
import 'package:freebie/features/auth/presentation/widget/old_user.dart';

class SocialAuth extends StatelessWidget {
  final bool isSingUp;
  const SocialAuth({super.key, required this.isSingUp});

  Widget theFotter() {
    if (isSingUp) {
      return OldUser();
    } else {
      return NewUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            SizedBox(height: 25),
            OrDivider(),
            SizedBox(height: 25),
            SocialButton(
              iconPath: "asset/icon/google.svg",
              textUsing: '${(isSingUp) ? "Sing Up" : "login"} with Google',
              backgroundColor: AppColor.p0,
              fontColor: AppColor.p900,
              withIdge: true,
            ),
            SizedBox(height: 20),
            SocialButton(
              iconPath: "asset/icon/facebook.svg",
              textUsing: '${(isSingUp) ? "Sing Up" : "login"} with Facebook',
              backgroundColor: AppColor.facebook,
            ),
          ],
        ),
        SizedBox(height: 50,),
        theFotter(),
      ],
    );
  }
}
