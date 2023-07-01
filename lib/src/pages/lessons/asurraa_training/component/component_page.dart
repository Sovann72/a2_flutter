// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sura_flutter/sura_flutter.dart';

class ComponentPage extends StatefulWidget {
  const ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  @override
  Widget build(BuildContext context) {
    Widget suraConfirmDialog1 = SuraConfirmationDialog(
      content: const Text("Are you sure to exit?"),
      cancelText: "cancel",
      confirmText: "confirm",
      onCancel: () {},
      onConfirm: () {},
      swapButtonsPosition: true,
      title: "Component",
    );

    Widget suraConfirmDialog2 = SuraConfirmationDialog(
      content: const Text("Are u sure u want to delete your own account?"),
      cancelText: "ok",
      confirmText: "no",
      onCancel: () {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            builder: (context) {
              return Container(
                height: 300,
                child: Center(child: Text("look at me")),
              );
            });
      },
      onConfirm: () async {
        final DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime(2020),
            firstDate: DateTime(1990),
            lastDate: DateTime(2050));
      },
      swapButtonsPosition: true,
      title: "Component",
    );
    Widget suraConfirmDialog3 = SuraConfirmationDialog(
      content: const Text("Are you sure to exit?"),
      cancelText: "cancel",
      confirmText: "confirm",
      onCancel: () {},
      onConfirm: () {},
      swapButtonsPosition: false,
      title: "Component",
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("how do we use component?"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.5,
          // decoration: BoxDecoration(border: Border.all()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(Icons.upload),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => suraConfirmDialog1)),
              IconButton(
                  icon: Icon(
                    Icons.upload,
                    color: Colors.red,
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => suraConfirmDialog2)),
              IconButton(
                  icon: Icon(
                    Icons.upload,
                    color: Colors.blue,
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => suraConfirmDialog3)),
            ],
          ),
        ),
      ),
    );
  }
}
