import 'dart:convert';

import 'package:a2_tutorial/src/services/file_service.dart';
import 'package:a2_tutorial/src/utilities/one_time/student_model.dart';
import 'package:flutter/cupertino.dart';

class StudentOfflineDataProvider extends ChangeNotifier {
  static const String _STUDENT_FILE_NAME = "student.json";
  late String data;

  Future<List<StudentModel>> readList() async {
    data = await FileService.readFile(_STUDENT_FILE_NAME);
    final res = jsonDecode(data)["data"];
    final List<StudentModel> studentList = List<StudentModel>.from(
        res.map((e) => StudentModel.fromMap(jsonDecode(e))));
    return studentList;
  }

  Future<void> write<T>(T data) async {
    data = await FileService.writeFile(_STUDENT_FILE_NAME,
        content: jsonEncode({"data": data}));
    notifyListeners();
  }
}
