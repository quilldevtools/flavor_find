class Recipe {
  final int id;
  final String name;
  final String thumbnail_url;
  final List<String> instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.thumbnail_url,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      thumbnail_url: json['thumbnail_url'],
      instructions: List<String>.from(json['instructions']
          .map((instruction) => instruction['display_text'])),
    );
  }
}
