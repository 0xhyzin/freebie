import 'package:flutter/material.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';

class MainAuthLayout extends StatefulWidget {
  final String title;
  final String subTitle;
  final AuthPageType page;
  final String email;
  const MainAuthLayout({
    super.key,
    required this.title,
    required this.subTitle,
    required this.page,
    this.email = "",
  });

  @override
  State<MainAuthLayout> createState() => _MainAuthLayoutState();
}

class _MainAuthLayoutState extends State<MainAuthLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(top: 10, bottom: 10),
          child: Text(widget.title, style: AppTextStyle.h2sb),
        ),

        widget.page == AuthPageType.enterDigit
            ? RichText(
                text: TextSpan(
                  style: AppTextStyle.b1WithColor,
                  children: [
                    TextSpan(text: widget.subTitle),
                    TextSpan(
                      text: "(${widget.email})",
                      style: AppTextStyle.email,
                    ),
                  ],
                ),
              )
            : Text(widget.subTitle, style: AppTextStyle.b1r),
        SizedBox(height: 20),
      ],
    );
  }
}
