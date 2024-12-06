import 'package:flutter/material.dart';
import '../model/credentials.dart';

class CredentialProvider extends ChangeNotifier {
  Credentials? _credentials;

  Credentials? get credentials => _credentials;

  void setCredentials(String mobileNumber, String password) {
    _credentials = Credentials(mobileNumber: mobileNumber, password: password);
    notifyListeners();
  }
}
