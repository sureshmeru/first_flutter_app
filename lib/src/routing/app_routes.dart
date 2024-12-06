import 'package:flutter/material.dart';
import 'package:flutter_application_curd/src/features/authentication/login/login.dart';
import 'package:flutter_application_curd/src/features/authentication/otp/otp.dart';
import 'package:flutter_application_curd/src/features/home/Home.dart';

class AppRoutes {
  static const String loginScreen = '/';
  static const String otpScreen = '/otp';
  static const String homeScreen = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case otpScreen:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}