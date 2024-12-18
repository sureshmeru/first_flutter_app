import 'package:flutter/material.dart';
import '../services/api_service.dart';

class DataProvider with ChangeNotifier {
  List<dynamic> _items = [];
  bool _isLoading = false;

  List<dynamic> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> fetchItems() async {
    _isLoading = true;
    notifyListeners();
    try {
      _items = await ApiService.fetchItems();
    } catch (e) {
      _items = [];
    }
    _isLoading = false;
    notifyListeners();
  }
}
