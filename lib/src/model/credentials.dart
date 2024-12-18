class Credentials {
  final String? username;
  final String? email;
  final String mobileNumber;
  final String password;

  Credentials({
    required this.username,
    required this.email,
    required this.mobileNumber,
    required this.password
  });
   @override
  String toString() {
    return 'Credentials(username: $username, email: $email, mobileNumber: $mobileNumber, password: $password)';
  }
}
