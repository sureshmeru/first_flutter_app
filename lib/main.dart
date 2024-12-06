import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_curd/src/provider/credential_provider.dart';
import 'package:flutter_application_curd/src/routing/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (_) => CredentialProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.loginScreen,
    );
  }
}
