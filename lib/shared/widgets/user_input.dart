import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/shared/utils/type_user_input.dart';

class UserInput extends StatefulWidget {
  final String textLabel;
  final String? Function(String?) invokeTypeFunction;
  final String hintInput;
  bool isPassword;

  UserInput({
    super.key,
    required this.textLabel,
    required this.invokeTypeFunction,
    required this.hintInput,
    this.isPassword = false,
  });

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool isValidInput = false;
  bool isFirst = true;
  bool isObserve = true;

  void changeObserve() {
    setState(() {
      isObserve = !isObserve;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.textLabel, style: AppTextStyle.b1m),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 80,
          child: TextFormField(
            enableSuggestions: true,
            obscureText:widget.isPassword? isObserve:false,
          
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: AppTextStyle.b1m,
            autovalidateMode: AutovalidateMode.onUnfocus,
            validator: (value) {
              setState(() {
                isFirst = false;
              });
              String? result = widget.invokeTypeFunction(value);
              setState(() {
                isValidInput = (result == null) ? true : false;
              });
              return result;
            },
            decoration: InputDecoration(
              suffixIcon: (widget.isPassword)
                  ? IconButton(
                      onPressed: changeObserve,
                       icon: isObserve?Icon(Icons.visibility_off):Icon(Icons.visibility),
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
                        size: 24,
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
