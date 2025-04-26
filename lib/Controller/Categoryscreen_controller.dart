import 'package:flutter/material.dart';
import 'package:habbition_test/Model/Categoryscreen_model';
import 'package:habbition_test/Model/Product_model.dart';
import 'package:habbition_test/Services/API_services.dart';

class CategoryscreenController with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Categoryscreenmodel> categoryList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchCategories() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      categoryList = await _apiService.fetchCategories();
    } catch (e) {
      errorMessage = e.toString();
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<Productscreenmodel> ProductList = [];
  bool isLoadings = false;
  String? errorMessages;

  Future<void> fetchproducts() async {
    isLoadings = true;
    errorMessages = null;
    notifyListeners();

    try {
      ProductList = await _apiService.fetchproducts();
    } catch (e) {
      errorMessages = e.toString();
      print(errorMessages);
    } finally {
      isLoadings = false;
      notifyListeners();
    }
  }

  Future<void> fetchProductsByCategory(int categoryId) async {
    isLoadings = true;
    errorMessages = null;
    notifyListeners();

    try {
      ProductList = await _apiService.fetchProductsByCategory(categoryId);
    } catch (e) {
      errorMessages = e.toString();
      print(errorMessages);
    } finally {
      isLoadings = false;
      notifyListeners();
    }
  }
}
