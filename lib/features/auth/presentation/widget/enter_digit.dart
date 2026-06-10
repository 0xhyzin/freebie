import 'package:flutter/widgets.dart';
import 'package:freebie/features/auth/presentation/widget/digit_input.dart';

class EnterDigit extends StatelessWidget {
  const EnterDigit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 10),
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [DigitInput(), DigitInput(), DigitInput(), DigitInput()],
        ),
      ),
    );
  }
}
