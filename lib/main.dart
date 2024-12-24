import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_curd/src/providers/credential_provider.dart';
import 'package:flutter_application_curd/src/providers/data_provider.dart';
import 'package:flutter_application_curd/src/routing/app_routes.dart';
import 'package:flutter_application_curd/src/providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (_) => CredentialProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: themeProvider.themeMode,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.registrationScreen,
    );
  }
}
