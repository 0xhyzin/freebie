import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';

class DigitInput extends StatefulWidget {
  final Function onChangeInput;
  final TextEditingController controller;
  const DigitInput({
    super.key,
    required this.controller,
    required this.onChangeInput,
  });

  @override
  State<DigitInput> createState() => _DigitInputState();
}

class _DigitInputState extends State<DigitInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 60,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: AppTextStyle.h2sb,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          widget.onChangeInput();
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.p900),
          ),
        ),
      ),
    );
  }
}
