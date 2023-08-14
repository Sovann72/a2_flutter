import 'package:a2_tutorial/widget/lesson_template.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../pages/list/lesson_model.dart';

class SoriyaPage extends StatelessWidget {
  final String title;
  final List<SubLessonModel> lessons;
  const SoriyaPage({super.key, required this.lessons, required this.title});

  @override
  Widget build(BuildContext context) {
    return LessonTemplate(
      lessonModel: lessons,
      title: title,
    );
  }
}
