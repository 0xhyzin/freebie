import 'package:flutter/widgets.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/widget/main_auth_layout.dart';

class AuthSingUp extends StatelessWidget {
  const AuthSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAuthLayout(
      title: "Create an account",
      subTitle: "Let’s create your account.",
      page: AuthPageType.singUp,
      buttonTitle: "Create an Account",
      withPolicy: true,
      withSocialLocgin: true,
    );
  }
}
