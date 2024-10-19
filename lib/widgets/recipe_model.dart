class Recipe {
  final int id;
  final String name;
  final String thumbnailUrl;
  final String prepTime;
  final String difficulty;
  final List<String> instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.prepTime,
    required this.difficulty,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      thumbnailUrl: json['thumbnail_url'],
      prepTime: json['prep_time_minutes'] != null ? '${json['prep_time_minutes']} min' : 'N/A',
      difficulty: json['difficulty'] ?? 'Easy',
      instructions: List<String>.from(json['instructions'].map((instruction) => instruction['display_text'])),
    );
  }
}

