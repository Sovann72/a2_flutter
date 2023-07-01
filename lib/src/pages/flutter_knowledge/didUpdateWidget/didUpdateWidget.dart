import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DidUpdateWidgetExample extends StatefulWidget {
  const DidUpdateWidgetExample({super.key});

  @override
  State<DidUpdateWidgetExample> createState() => _DidUpdateWidgetExampleState();
}

class _DidUpdateWidgetExampleState extends State<DidUpdateWidgetExample> {
  String title = "it did not";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("did it update widget?")),
      body: Center(
          child: _NewDidItUpdateWidget(
        title: title,
      )),
      floatingActionButton: IconButton(
        icon: Icon(Icons.update),
        onPressed: () {
          setState(() {
            title = "it now is";
          });
        },
      ),
    );
  }
}

class _NewDidItUpdateWidget extends StatefulWidget {
  const _NewDidItUpdateWidget({super.key, required this.title});
  final String title;

  @override
  State<_NewDidItUpdateWidget> createState() => _NewDidItUpdateWidgetState();
}

class _NewDidItUpdateWidgetState extends State<_NewDidItUpdateWidget> {
  String get title => widget.title;

  @override
  void didUpdateWidget(covariant _NewDidItUpdateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('\x1B[32moldWidget: ${oldWidget.title}');
    print('\x1B[32mnewOne: ${widget.title}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Text(title, textAlign: TextAlign.center),
    );
  }
}
