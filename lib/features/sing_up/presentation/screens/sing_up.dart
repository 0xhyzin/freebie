import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/shared/utils/type_user_input.dart';
import 'package:freebie/shared/widgets/user_input.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(top: 70, bottom: 10),
              child: Text("Create an account", style: AppTextStyle.h2sb),
            ),
            Text("Let’s create your account.", style: AppTextStyle.b1r),
            SizedBox(height: 10),
            UserInput(
              textLabel: "Full Name",
              invokeTypeFunction: validateUserName,
              hintInput: "Enter your full name",
            ),
            SizedBox(height: 10),
            UserInput(
              textLabel: "Email",
              invokeTypeFunction: validateEmail,
              hintInput: "Enter your email address",
            ),
            SizedBox(height: 10),
            UserInput(
              textLabel: "Password",
              invokeTypeFunction: validatePassword,
              hintInput: "Enter your password",
              isPassword: true,
            ),
            SizedBox(height: 10),
            Text(
              "By signing up you agree to our Terms, Privacy Policy, and Cookie Use",
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child: Text("Create an Account"))
          ],
        ),
      ),
    );
  }
}
