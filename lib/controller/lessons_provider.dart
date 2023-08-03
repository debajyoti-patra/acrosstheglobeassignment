import 'package:acrosstheglobe_assignment1/constants/url.dart';
import 'package:acrosstheglobe_assignment1/models/lessons_model.dart';
import 'package:acrosstheglobe_assignment1/services/services.dart';
import 'package:flutter/cupertino.dart';

class LessonProvider extends ChangeNotifier{
  List<LessonModel> lessonResult = [];
  void getLessons(BuildContext context)async{
    final json = await AppServices.getData(AppUrl.lessonsurl,context);
    final result = json.map((e) {
      return LessonModel.fromJson(e);
    }).toList();
    lessonResult = result;
    notifyListeners();
  }
}