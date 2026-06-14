import 'package:freebie/features/auth/presentation/util/input_type.dart';
import 'package:freebie/features/auth/presentation/util/type_user_input.dart';
import 'package:riverpod/riverpod.dart';


class InputProvider extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void makeInputValid(bool value) {
    state = value;
  }
}

class InputFirstProvider extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void makeInputValid(bool value) {
    state = value;
  }
}

final inputProviderNotifier =
    NotifierProvider.family<InputProvider, bool, TypeUserInput>(
      (type) => InputProvider(),
    );

final inputFirstProviderNotifier =
    NotifierProvider.family<InputProvider, bool, TypeUserInput>(
      (type) => InputProvider(),
    );
