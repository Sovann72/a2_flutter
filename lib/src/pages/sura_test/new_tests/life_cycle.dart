import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sura_flutter/sura_flutter.dart';

class LifeCycleScreen extends StatefulWidget {
  const LifeCycleScreen({super.key});

  @override
  State<LifeCycleScreen> createState() => _LifeCycleScreenState();
}

class _LifeCycleScreenState extends State<LifeCycleScreen> {
  TextEditingController controller = TextEditingController();
  ValueNotifier<int> something = ValueNotifier<int>(0);

  @override
  void initState() {
    controller.addListener(() {
      print("controller: ${controller.text}");
    });

    something.addListener(() {
      print("something: ${something.value}");
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    something.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  something.value++;
                  something.notifyListeners();
                  // setState(() {});
                },
                child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: Center(
                        child: ValueListenableBuilder(
                            valueListenable: something,
                            // child: Container(
                            //   child: Text(something.value.toString()),
                            // ),
                            builder: (context, value, child) {
                              // return child!;
                              return Text(
                                value.toString(),
                                style: TextStyle(color: Colors.white),
                              );
                            }))),
              ),
              SpaceY(100),
              TextField(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
