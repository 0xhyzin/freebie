import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 2, color: AppColor.p100)),
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: Text("Or", style: AppTextStyle.b2r),
        ),
        Expanded(child: Container(height: 2, color: AppColor.p100)),
      ],
    );
  }
}
