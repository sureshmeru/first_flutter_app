bool validatePassword(String password) {
  // Define the regex pattern for the password validation
  final RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');

  // Return true if the password matches the regex pattern, otherwise false
  return regex.hasMatch(password);
}