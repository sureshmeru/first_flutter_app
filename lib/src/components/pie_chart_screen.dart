import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart'; 

class PieChartScreen extends StatefulWidget {
  const PieChartScreen({super.key});

  @override
  _PieChartScreenState createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  Map<String, double> dataMap = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
  try {
    final response = await http.get(
      Uri.parse('https://6768f414cbf3d7cefd391a6a.mockapi.io/picChartData'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      // if (jsonData is List) {
        // Combine values from all objects in the array
        final Map<String, double> combinedData = {};

        for (var item in jsonData) {
          if (item is Map<String, dynamic>) {
            item.forEach((key, value) {
              if (value is num) {
                if (combinedData.containsKey(key)) {
                  combinedData[key] = combinedData[key]! + value.toDouble();
                } else {
                  combinedData[key] = value.toDouble();
                }
              }
            });
          }
        }

        setState(() {
          dataMap = combinedData;
          isLoading = false;
        });
      // } else {
      //   throw Exception('Unexpected JSON format: Root is not a list');
      // }
    } else {
      throw Exception('Failed to load data with status code ${response.statusCode}');
    }
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error fetching data: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart Screen'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartRadius: MediaQuery.of(context).size.width / 2.5,
                chartType: ChartType.disc,
                colorList: const [
                  Colors.blue,
                  Colors.red,
                  Colors.green,
                  Colors.yellow,
                  Colors.orange,
                ],
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                ),
              ),
            ),
    );
  }
}
