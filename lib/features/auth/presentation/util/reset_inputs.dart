import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freebie/features/auth/presentation/provider/input_state_provider.dart';
import 'package:freebie/features/auth/presentation/util/auth_page_type.dart';
import 'package:freebie/features/auth/presentation/util/input_type.dart';
import 'package:freebie/features/auth/presentation/util/list_auth_input.dart';

void resetInputs(WidgetRef ref, GlobalKey<FormState> formkey) {
  for (InputType inputType in listInputForEachPage[AuthPageType.allScreens]!) {
    ref
        .read(inputProviderNotifier(inputType.typeInput).notifier)
        .makeInputValid(false);
    ref
        .read(inputFirstProviderNotifier(inputType.typeInput).notifier)
        .makeInputValid(false);
  }
  formkey.currentState!.reset();
  clearAllController();
}
