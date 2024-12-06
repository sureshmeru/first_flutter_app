import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_curd/src/provider/credential_provider.dart';
import 'package:flutter_application_curd/src/routing/app_routes.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  String? _validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the OTP';
    } else if (value.length != 6) {
      return 'OTP must be 6 digits';
    }
    return null;
  }

  void _submitOTP() {
    if (_formKey.currentState!.validate()) {
      // Perform OTP verification here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Verified')),
      );
      Navigator.pushNamed(context, AppRoutes.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final credentials = Provider.of<CredentialProvider>(context).credentials;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (credentials != null) ...[
                  Text('Mobile: ${credentials.mobileNumber}'),
                  Text('Password: ${credentials.password}'),
                ],
                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only numeric input
                  decoration: const InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateOTP,
                  maxLength: 6,
                  onFieldSubmitted: (value) { _submitOTP();}
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitOTP,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  ),
                  child: const Text('Verify OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
