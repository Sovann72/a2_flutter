import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChangeColorsPage extends StatefulWidget {
  const ChangeColorsPage({super.key});

  @override
  State<ChangeColorsPage> createState() => _ChangeColorsPageState();
}

class _ChangeColorsPageState extends State<ChangeColorsPage> {
  // late Color _color;
  List<Color> listOfColor = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple
  ];
  late int i;
  late int j;

  @override
  void initState() {
    i = 0;
    j = 0;
    // _color = listOfColor[i];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("onboarding task")),
      body: Center(
          child: GestureDetector(
        onTap: () {
          i++;
          if (i % 5 == 0) {
            j++;
            if (j == 5) {
              j = 0;
            }
          }
          setState(() {});
        },
        child: Container(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: listOfColor[j]),
              ),
              i == 0
                  ? Text("ខ្ញុំមិនទាន់បានចុចអ្វីទាំងអស់")
                  : Text("ខ្ញុំបានចុចរង្វង់ ${i} ដងហើយ!")
            ],
          ),
        ),
      )),
    );
  }
}
