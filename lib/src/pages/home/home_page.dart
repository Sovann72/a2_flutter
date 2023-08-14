import 'package:a2_tutorial/src/pages/home/list_of_lessons.dart';
import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  NewWidget({super.key});

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              number += 1;
            },
            child: Text(number.toString())));
  }
}

class NewStateFul extends StatefulWidget {
  const NewStateFul({super.key});

  @override
  State<NewStateFul> createState() => _NewStateFulState();
}

class _NewStateFulState extends State<NewStateFul> {
  int number = 0;
  // int? unknownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        number += 1;
        setState(() {});
      },
      child: Text(number.toString()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //     debugShowCheckedModeBanner: false,
        //     home: Scaffold(
        //         appBar: AppBar(
        //           title: Text('A2'),
        //         ),
        //         body: Column(
        //           children: [NewStateFul(), NewWidget()],
        //         )
        Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListView.builder(
          itemCount: listOfLesson.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Card(
                child: ListTile(
                  title: Text(listOfLesson[index].title!),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => listOfLesson[index].page!)));
                  },
                ),
              ),
            );
          }),
    );
    // ));
  }
}
