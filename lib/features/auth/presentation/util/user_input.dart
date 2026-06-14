import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freebie/core/config/theme/app_color.dart';
import 'package:freebie/core/config/theme/app_text_style.dart';
import 'package:freebie/features/auth/presentation/provider/input_state_provider.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';

class UserInput extends ConsumerStatefulWidget {
  final String textLabel;
  final String hintInput;
  final Function onChangeInput;
  final String? Function(String?) invokeTypeFunction;
  final TextEditingController controller;
  final TypeUserInput typeInput;
  final bool isPassword;

  const UserInput({
    super.key,
    required this.textLabel,
    required this.invokeTypeFunction,
    required this.hintInput,
    required this.controller,
    required this.onChangeInput,
    required this.typeInput,
    this.isPassword = false,
  });

  @override
  ConsumerState<UserInput> createState() => _UserInputState();
}

class _UserInputState extends ConsumerState<UserInput> {
  String? errorResult;

  bool isObserve = true;

  void changeObserve() {
    setState(() {
      isObserve = !isObserve;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isValidInput = ref.watch(
      inputProviderNotifier(widget.typeInput),
    );
    final bool isVlaid = ref.watch(
      inputFirstProviderNotifier(widget.typeInput),
    );
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

            onChanged: (value) => widget.onChangeInput(),

            validator: (value) {
              ref
                  .read(inputFirstProviderNotifier(widget.typeInput).notifier)
                  .makeInputValid(true);
              errorResult = widget.invokeTypeFunction(value);
              ref
                  .read(inputProviderNotifier(widget.typeInput).notifier)
                  .makeInputValid((errorResult == null) ? true : false);

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
              suffix: isVlaid
                  ? Padding(
                      padding: EdgeInsetsGeometry.all(4),
                      child: (isValidInput)
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
                    )
                  : null,
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
