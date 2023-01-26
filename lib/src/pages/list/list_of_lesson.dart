import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/1.1.scaffold_safeArea.dart';
import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/a2safeArea.dart';
import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/a2scaffold.dart';
import 'package:flutter/material.dart';

class LessonModel {
  final String? title;
  final Widget? page;
  // final List<SubLessonModel>? lessons;

  LessonModel(
      {required this.title,
      // required this.lessons,
      required this.page});
}

class SubLessonModel {
  final String? title;
  final Widget? pages;

  SubLessonModel({required this.title, required this.pages});
}
