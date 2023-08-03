class LessonModel {
  final String? name;
  final int? duration;
  final String? category;
  final bool? locked;
  final String? id;

  LessonModel(
      {required this.name,
      required this.duration,
      required this.category,
      required this.locked,
      required this.id});
  factory LessonModel.fromJson(Map<String, dynamic> map) => LessonModel(
      name: map['name'],
      duration: map['duration'],
      category: map['category'],
      locked: map['locked'],
      id: map['id']);
}
