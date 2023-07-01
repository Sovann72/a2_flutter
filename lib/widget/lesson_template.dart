import 'package:a2_tutorial/src/pages/list/lesson_model.dart';
import 'package:a2_tutorial/widget/appBar_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LessonTemplate extends StatelessWidget {
  final String title;
  final List<SubLessonModel> lessonModel;
  const LessonTemplate(
      {super.key, required this.title, required this.lessonModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView.builder(
            itemCount: lessonModel.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Card(
                  child: ListTile(
                    title: Text(lessonModel[index].title!),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return lessonModel[index].pages!;
                      })));
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
