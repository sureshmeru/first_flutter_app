import 'package:flutter/material.dart';
import '../model/credentials.dart';

class CredentialProvider extends ChangeNotifier {
  Credentials? _credentials;
  final List<Credentials> _users = [
    // Default user
    Credentials(
      username: 'suresh',
      email: 's@s.s',
      mobileNumber: '9876543211',
      password: 'Ss123456',
    ),
  ];

  Credentials? get credentials => _credentials;
  List<Credentials> get users => _users;

  void setCredentials(String mobileNumber, String password,
      {String? username, String? email}) {
    _credentials = Credentials(
      username: username,
      email: email,
      mobileNumber: mobileNumber,
      password: password,
    );
    notifyListeners();
  }

  void registerUser(
      String mobileNumber, String password, String username, String email) {
    _users.add(Credentials(
      username: username,
      email: email,
      mobileNumber: mobileNumber,
      password: password,
    ));
    _credentials = Credentials(
      username: username,
      email: email,
      mobileNumber: mobileNumber,
      password: password,
    );
    notifyListeners();
  }

  String? loginUser(String mobileNumber, String password) {
    print('Users List: $_users');
    for (var user in _users) {
      print('Checking user: $user');
      print('Checking against user: ${user.mobileNumber}, ${user.password}');
      if (user.mobileNumber == mobileNumber.trim() &&
          user.password.trim() == password) {
        _credentials = user; // Set current user credentials
        notifyListeners();
        return null; // Login successful, no error message
      }
    }
    return 'Invalid mobile number or password'; // Return error message
  }
}
