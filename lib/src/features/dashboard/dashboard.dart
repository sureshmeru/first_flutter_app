import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Submitted'),
              Tab(text: 'Draft'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ApplicationListScreen(status: 'Submitted'),
            ApplicationListScreen(status: 'Draft'),
          ],
        ),
      ),
    );
  }
}

class ApplicationListScreen extends StatelessWidget {
  final String status;

  const ApplicationListScreen({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    // Replace this list with actual data
    final applications = List.generate(10, (index) => '$status Application ${index + 1}');

    return ListView.builder(
      itemCount: applications.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(applications[index]),
          subtitle: Text('$status Application Details'),
        );
      },
    );
  }
}
