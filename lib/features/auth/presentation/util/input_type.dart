import 'package:flutter/widgets.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';

class InputType {
  InputType(
    this.label,
    this.hintText,
    this.isPassword,
    this.typeInput,
    this.invokeTypeFunction,
  );
  late String label;
  late String hintText;
  late bool isPassword;
  late String? Function(String?) invokeTypeFunction;
  late TypeUserInput typeInput;
  final TextEditingController controller = TextEditingController();
}
