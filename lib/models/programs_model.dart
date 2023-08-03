class ProgramsModel {
  final String? name;
  final String? category;
  final int? lesson;
  final String? id;

  ProgramsModel(
      {required this.name,
      required this.category,
      required this.lesson,
      required this.id});
  factory ProgramsModel.fromJson(Map<String, dynamic> json) => ProgramsModel(
        name: json['name'],
        category: json['category'],
        lesson: json['lesson'],
        id: json['id'],
      );
}
