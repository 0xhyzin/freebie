import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/features/auth/presentation/util/input_type.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';

class UserInput extends StatefulWidget {
  final String textLabel;
  final String? Function(String?) invokeTypeFunction;
  final String hintInput;
  final void Function(bool, TypeUserInput) isValidInput;
  final TextEditingController controller;
  final TypeUserInput inputType;
  bool isPassword;

  UserInput({
    super.key,
    required this.textLabel,
    required this.invokeTypeFunction,
    required this.hintInput,
    required this.isValidInput,
    required this.controller,
    required this.inputType,
    this.isPassword = false,
  });

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool isValidInput = false;
  String? errorResult;

  bool isFirst = true;

  bool isObserve = true;

  void changeObserve() {
    setState(() {
      isObserve = !isObserve;
    });
  }

  void checkIsValid(String value) {
    isFirst = false;
    errorResult = widget.invokeTypeFunction(value);
    setState(() {
      isValidInput = (errorResult == null) ? true : false;
    });
    widget.isValidInput(isValidInput, widget.inputType);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.textLabel, style: AppTextStyle.b1m),
        SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          height: 85,
          child: TextFormField(
            controller: widget.controller,
            enableSuggestions: true,
            obscureText: widget.isPassword ? isObserve : false,

            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: AppTextStyle.b1m,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            onChanged: (value) => checkIsValid(value),

            validator: (value) {
              return errorResult;
            },
            decoration: InputDecoration(
              suffixIcon: (widget.isPassword)
                  ? IconButton(
                      onPressed: changeObserve,
                      icon: isObserve
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    )
                  : null,
              hint: Text(widget.hintInput, style: AppTextStyle.b1r),
              errorStyle: AppTextStyle.b2m,
              suffix: Padding(
                padding: EdgeInsetsGeometry.all(4),
                child: (isFirst)
                    ? null
                    : (isValidInput)
                    ? FaIcon(
                        FontAwesomeIcons.circleCheck,
                        color: AppColor.success,
                        size: 20,
                      )
                    : FaIcon(
                        FontAwesomeIcons.circleXmark,
                        color: AppColor.error,
                        size: 20,
                      ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: isValidInput ? AppColor.success : AppColor.p200,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: isValidInput ? AppColor.success : AppColor.p200,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: isValidInput ? AppColor.success : AppColor.p200,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
