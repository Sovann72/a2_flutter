import 'package:a2_tutorial/src/pages/list/lesson_model.dart';
import 'package:a2_tutorial/widget/lesson_template.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnBoardingTask extends StatelessWidget {
  final String title;
  final List<SubLessonModel> lessons;
  const OnBoardingTask({super.key, required this.title, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return LessonTemplate(title: title, lessonModel: lessons);
  }
}
