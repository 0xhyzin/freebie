import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freebie/core/config/theme/app_color.dart';

class ButtonSocialLogin extends StatelessWidget {
  final String iconPath;
  final String textUsing;
  final Color? backgroundColor;
  final Color? fontColor;
  final bool withIdge;
  const ButtonSocialLogin({
    super.key,
    required this.iconPath,
    required this.textUsing,
    this.backgroundColor,
    this.fontColor,
    this.withIdge = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: fontColor,
        side: (withIdge) ? BorderSide(color: AppColor.p200) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, width: 24, height: 24),
          SizedBox(width: 10),
          Text(textUsing),
        ],
      ),
    );
  }
}
