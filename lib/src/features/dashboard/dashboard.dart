import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/credential_provider.dart';

import 'package:flutter_application_curd/src/providers/data_provider.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final credentials = Provider.of<CredentialProvider>(context).credentials;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Welcome, ${credentials?.username ?? 'User'}'),
          // title: const Text('Dashboard'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Submitted'),
              Tab(text: 'Draft'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            dataProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: dataProvider.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(dataProvider.items[index]['title']),
                        subtitle: Text(dataProvider.items[index]['body']),
                      );
                    },
                  ),
            const Center(child: Text('Draft Screen')),

          ],
        ),
      ),
    );
  }
}
