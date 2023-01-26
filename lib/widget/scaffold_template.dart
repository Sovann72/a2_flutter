import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyScaffoldTemplate extends StatelessWidget {
  final String? title;
  final bool? centerTitle;
  final Widget? body;
  const MyScaffoldTemplate(
      {super.key, this.body, this.centerTitle, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: centerTitle ?? true,
      ),
      body: body,
    );
  }
}
