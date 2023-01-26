import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyColumn extends StatelessWidget {
  const MyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column"),
        centerTitle: true,
      ),
      body: Container(
        height: 600,
        width: MediaQuery.of(context).size.width,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  width: 300,
                  child: ListTile(
                      title: Text("sovann"),
                      leading: Icon(Icons.south_america_outlined)),
                ),
              ),
              Card(
                child: Container(
                  width: 300,
                  child: ListTile(
                      title: Text("sovann"),
                      leading: Icon(Icons.south_america_outlined)),
                ),
              ),
              Card(
                child: Container(
                  width: 300,
                  child: ListTile(
                      title: Text("sovann"),
                      leading: Icon(Icons.south_america_outlined)),
                ),
              ),
              Card(
                child: Container(
                  width: 300,
                  child: ListTile(
                      title: Text("sovann"),
                      leading: Icon(Icons.south_america_outlined)),
                ),
              ),
              Card(
                child: Container(
                  width: 300,
                  child: ListTile(
                      title: Text("sovann"),
                      leading: Icon(Icons.south_america_outlined)),
                ),
              ),
            ]),
      ),
    );
  }
}
