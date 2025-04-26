import 'package:habbition_test/Model/Categoryscreen_model';
import 'package:habbition_test/Model/Product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://api.escuelajs.co/api/v1";

  Future<List<Categoryscreenmodel>> fetchCategories() async {
    final url = Uri.parse("$baseUrl/categories");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return categoryscreenmodelFromJson(response.body);
      } else {
        throw Exception("Failed to load categories: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching categories: $e");
    }
  }

  Future<List<Productscreenmodel>> fetchproducts() async {
    final url = Uri.parse("$baseUrl/products");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return productscreenmodelFromJson(response.body);
      } else {
        throw Exception("Failed to load products: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching products: $e");
    }
  }

  // In ApiService class
  Future<List<Productscreenmodel>> fetchProductsByCategory(
      int categoryId) async {
    final url = Uri.parse("$baseUrl/categories/$categoryId/products");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return productscreenmodelFromJson(response.body);
      } else {
        throw Exception(
            "Failed to load products for category: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching products for category: $e");
    }
  }
}
