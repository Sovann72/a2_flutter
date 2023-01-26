import 'package:a2_tutorial/src/pages/list/list_of_lesson.dart';
import 'package:a2_tutorial/widget/lesson_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyContainerAndPositioning extends StatelessWidget {
  final String title;
  final List<SubLessonModel> lessons;
  const MyContainerAndPositioning(
      {super.key, required this.lessons, required this.title});

  @override
  Widget build(BuildContext context) {
    return LessonTemplate(
      title: title,
      lessonModel: lessons,
    );
  }
}
