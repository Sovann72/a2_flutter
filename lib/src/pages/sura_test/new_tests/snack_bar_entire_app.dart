import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SnackBarEntireAppPage extends StatefulWidget {
  const SnackBarEntireAppPage({super.key});

  @override
  State<SnackBarEntireAppPage> createState() => _SnackBarEntireAppPageState();
}

class _SnackBarEntireAppPageState extends State<SnackBarEntireAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBar"),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              duration: Duration(seconds: 5),
              content: Container(
                decoration: BoxDecoration(border: Border.all()),
                height: 100,
                child: Text(
                  "bro wtf",
                  style: TextStyle(color: Colors.black),
                ),
              )));
        },
        child: Text("show SnackBar"),
      )),
    );
  }
}
