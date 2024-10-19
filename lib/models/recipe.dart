class Recipe {
  final String id;
  final String name;
  final String? thumbnailUrl;
  final String? category;
  final String? area;
  final List<String> instructions;
  final List<String> ingredients;

  Recipe({
    required this.id,
    required this.name,
    this.thumbnailUrl,
    this.category,
    this.area,
    required this.instructions,
    required this.ingredients,
  });

  factory Recipe.fromMealDBJson(Map<String, dynamic> json) {
    List<String> parseInstructions(String? instructionsString) {
      if (instructionsString == null) return [];
      return instructionsString
          .split('\r\n')
          .where((step) => step.isNotEmpty)
          .toList();
    }

    List<String> parseIngredients(Map<String, dynamic> json) {
      List<String> ingredients = [];
      for (int i = 1; i <= 20; i++) {
        String? ingredient = json['strIngredient$i'];
        String? measure = json['strMeasure$i'];
        if (ingredient != null && ingredient.isNotEmpty) {
          ingredients.add('$measure $ingredient'.trim());
        }
      }
      return ingredients;
    }

    return Recipe(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      thumbnailUrl: json['strMealThumb'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: parseInstructions(json['strInstructions']),
      ingredients: parseIngredients(json),
    );
  }
}
