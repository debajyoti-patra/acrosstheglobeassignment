
import 'package:acrosstheglobe_assignment1/constants/url.dart';
import 'package:flutter/material.dart';

import '../models/programs_model.dart';
import '../services/services.dart';

class ProgramsProvider extends ChangeNotifier{
  List<ProgramsModel> programResult = [];
  void getPrograms(BuildContext context) async {
    final json = await AppServices.getData(AppUrl.programsUrl,context);
    final result = json.map((e) {
      // return ProgramsModel(
      //     name: e['name'],
      //     category: e['category'],
      //     lesson: e['lesson'],
      //     id: e['id']);
      return ProgramsModel.fromJson(e);
    }).toList();
    programResult = result;
    notifyListeners();
  }
}
