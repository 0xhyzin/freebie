import 'package:flutter/widgets.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/widget/main_auth_layout.dart';

class AuthEnterDigitCode extends StatelessWidget {
  final String email;
  const AuthEnterDigitCode({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return MainAuthLayout(
      title: "Enter 4 Digit Code",
      subTitle: "Enter 4 digit code that your receive on your email.",
      email: email,
      page: AuthPageType.enterDigit,
      buttonTitle: "Continue",
      withResetPassword: false,
      withSocialLocgin: false,
    );
  }
}
