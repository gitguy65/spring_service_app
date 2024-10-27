import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spring_service/constants/const.dart';
import 'package:spring_service/data/models/category_model.dart';

class FetchTopCategories {
  Future<List<CategoryModel>> fetchTopCategories() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/topCategories'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<CategoryModel> categories = jsonResponse.map((category) {
          return CategoryModel(
            categoryImageUrl: category['categoryImageUrl'],
            categoryImageRadius: category['categoryImageRadius'],
            categoryName: category['categoryName'],
          );
        }).toList();
        return categories;
      } else {
        throw Exception('Failed to load bookings');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
