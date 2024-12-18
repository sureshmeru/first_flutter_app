bool validatePassword(String password) {
  // Define the regex pattern for the password validation
  final RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');

  // Return true if the password matches the regex pattern, otherwise false
  return regex.hasMatch(password);
}

bool validateMobile(String mobile) {
  // Define the regex pattern for the mobile validation
  final RegExp regex = RegExp(r'^[0-9]{10}$');

  // Return true if the mobile matches the regex pattern, otherwise false
  return regex.hasMatch(mobile);
}

bool validateEmail(String email) {
  // Define the regex pattern for the email validation
  final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  // Return true if the email matches the regex pattern, otherwise false
  return regex.hasMatch(email);
}