import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'package:flutter_application_curd/src/providers/credential_provider.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final credentials = Provider.of<CredentialProvider>(context).credentials;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final username = credentials?.username ?? 'Guest';
    print('====$credentials');

    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(themeProvider.themeMode == ThemeMode.dark ? Icons.brightness_2 : Icons.wb_sunny),
          onPressed: () {
            themeProvider.toggleTheme(themeProvider.themeMode != ThemeMode.dark);
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Add search functionality
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // Add notification functionality
          },
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Profile') {
              // Navigate to profile
            } else if (value == 'Logout') {
              // Perform logout
            }
          },
          itemBuilder: (BuildContext context) {
            return {'Hi $username', 'Profile', 'Logout'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
          child: Column(
            children: [
              const SizedBox(height: 4),
              const CircleAvatar(
                backgroundImage: NetworkImage('https://www.gravatar.com/avatar'), // Replace with user's profile image URL
              ),
              Text(username),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
