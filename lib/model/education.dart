class EducationModel {
  late final String years;
  late final String school;
  late final String department;
  late final String grade;

  EducationModel({
    required this.years,
    required this.school,
    required this.department,
    required this.grade,
  });

  Map<String, dynamic> toJson() {
    return {
      'years': years,
      'school': school,
      'department': department,
      'grade': grade,
    };
  }

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      years: json['years'] ?? '',
      school: json['school'] ?? '',
      department: json['department'] ?? '',
      grade: json['grade'] ?? '',
    );
  }
}
