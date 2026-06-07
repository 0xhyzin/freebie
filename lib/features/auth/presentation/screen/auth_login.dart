import 'package:flutter/widgets.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/widget/main_auth_layout.dart';

class AuthLogin extends StatelessWidget {
  const AuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAuthLayout(
      title: "Login to your account",
      subTitle: "It’s great to see you again.",
      page: AuthPageType.login,
      buttonTitle: "Login",
      withResetPassword: true,
      withSocialLocgin: true,
    );
  }
}
