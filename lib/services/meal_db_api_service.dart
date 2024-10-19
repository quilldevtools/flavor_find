import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class MealDBApiService {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Recipe>> getRecipes() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/search.php?s='),
      );

      if (response.statusCode == 200) {
        final List<dynamic> meals = json.decode(response.body)['meals'];
        return meals.map((json) => Recipe.fromMealDBJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load recipes: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error in getRecipes: $e');
      rethrow;
    }
  }
}
