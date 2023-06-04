import 'package:flutter/material.dart';

class FromProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValid() {
    print(email);
    print(password);
    print(formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  }
}
