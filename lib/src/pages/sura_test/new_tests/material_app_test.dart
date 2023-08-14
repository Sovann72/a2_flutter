import 'package:a2_tutorial/widget/scaffold_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyMaterialAppTest extends StatefulWidget {
  const MyMaterialAppTest({super.key});

  @override
  State<MyMaterialAppTest> createState() => _MyMaterialAppTestState();
}

class _MyMaterialAppTestState extends State<MyMaterialAppTest> {
  @override
  Widget build(BuildContext context) {
    // return MyScaffoldTemplate(
    //   title: "Material",
    //   body: ,
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("sovann"),
        ),
        body: Center(child: Text("center")),
      ),
    );
  }
}
