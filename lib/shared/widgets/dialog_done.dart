import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';

class DialogDone extends StatelessWidget {
  final String title;
  final String message;
  final String buttonTitle;
  final Function() buttonFunction;
  const DialogDone({
    super.key,
    required this.title,
    required this.message,
    required this.buttonTitle,
    required this.buttonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("asset/img/Check-duotone.png", width: 70, height: 70),
          SizedBox(height: 10),
          Text(title, style: AppTextStyle.h4sb, textAlign: TextAlign.center),
          SizedBox(height: 20),
          Text(message, style: AppTextStyle.b1r, textAlign: TextAlign.center),
          SizedBox(height: 20),
          ElevatedButton(onPressed: buttonFunction, child: Text(buttonTitle)),
        ],
      ),
    );
  }
}
