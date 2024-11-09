import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MealDBApiService {
  static const String _baseUrl = 'https://themealdb.p.rapidapi.com/search.php';
  static final Map<String, String> _headers = {
    'X-RapidAPI-Key': dotenv.env['RAPID_API_KEY']!,
    'X-RapidAPI-Host': 'themealdb.p.rapidapi.com',
  };

  Future<List<Recipe>> getRecipes({String query = ''}) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?s=$query'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> meals = json.decode(response.body)['meals'] ?? [];
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
