import 'package:flutter/widgets.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';

class InputType {
  InputType({
    this.label = "",
    this.hintText = "",
    this.isPassword = false,
    this.isConfirmPassword = false,
    required this.typeInput,
    this.invokeTypeFunction,
  });
  final String label;
  final String hintText;
  final bool isPassword;
  final bool isConfirmPassword;
  final String? Function(String?)? invokeTypeFunction;
  final TypeUserInput typeInput;
  final TextEditingController controller = TextEditingController();
}
