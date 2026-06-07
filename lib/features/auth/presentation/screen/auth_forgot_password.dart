import 'package:flutter/widgets.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/widget/main_auth_layout.dart';

class AuthForgotPassword extends StatelessWidget {
  const AuthForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAuthLayout(
      title: "Forgot password",
      subTitle:
          "Enter your email for the verification process. We will send 4 digits code to your email.",
      page: AuthPageType.forgotPassword,
      buttonTitle: "Send Code",
      withResetPassword: false,
      withSocialLocgin: false,
      
    );
  }
}
