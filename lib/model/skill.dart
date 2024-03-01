class Skill {
  late final String skillName;
  late final int proficiency;

  Skill({
    required this.skillName,
    required this.proficiency,
  });

  Map<String, dynamic> toJson() {
    return {
      'skillName': skillName,
      'proficiency': proficiency,
    };
  }

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      skillName: json['skillName'] ?? '',
      proficiency: json['proficiency'] ?? 0,
    );
  }
}
