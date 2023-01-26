import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAppBar extends PreferredSize {
  late final String title;

  MyAppBar({required super.child, required super.preferredSize});
  // const MyAppBar()

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
