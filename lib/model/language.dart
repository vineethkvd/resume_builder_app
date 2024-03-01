class Language {
  late final String name;
  late final int proficiency;

  Language({
    required this.name,
    required this.proficiency,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'proficiency': proficiency,
    };
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'] ?? '',
      proficiency: json['proficiency'] ?? 0,
    );
  }
}
