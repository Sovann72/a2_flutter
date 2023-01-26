import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyRow extends StatelessWidget {
  const MyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(border: Border.all()),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(border: Border.all()),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(border: Border.all()),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(border: Border.all()),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(border: Border.all()),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(border: Border.all()),
              ),
            ]),
      ),
    );
  }
}
