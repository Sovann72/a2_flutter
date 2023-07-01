import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DidChangeDependenciesExample extends StatefulWidget {
  const DidChangeDependenciesExample({super.key});

  @override
  State<DidChangeDependenciesExample> createState() =>
      _DidChangeDependenciesExampleState();
}

class _DidChangeDependenciesExampleState
    extends State<DidChangeDependenciesExample> {
  String title = "it did not";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("did it update widget?")),
      body: Center(child: NewDidChangeDependencies()),
      // floatingActionButton: IconButton(
      //   icon: Icon(Icons.update),
      //   onPressed: () {
      //     setState(() {
      //       title = "it now is";
      //     });
      //   },
      // ),
    );
  }
}

class NewDidChangeDependencies extends StatefulWidget {
  const NewDidChangeDependencies({super.key});

  @override
  State<NewDidChangeDependencies> createState() =>
      New_DidChangeDependenciesState();
}

class New_DidChangeDependenciesState extends State<NewDidChangeDependencies> {
  String firstDependencies = "first";
  String secondDependencies = "second";

  @override
  void didChangeDependencies() {
    print('\x1B[31mfirst: ${firstDependencies}');
    print('\x1B[31msecond: ${secondDependencies}');

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              firstDependencies = "newFirst";
              setState(() {});
            },
            icon: Icon(Icons.one_k),
            label: Text(""),
          ),
          TextButton.icon(
            onPressed: () {
              secondDependencies = "newSecond";
              setState(() {});
            },
            icon: Icon(Icons.two_k),
            label: Text(""),
          ),
        ],
      ),
    );
  }
}
