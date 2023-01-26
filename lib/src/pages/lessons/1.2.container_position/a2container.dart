import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        // clipBehavior: ,
        // constraints: ,
        // foregroundDecoration: ,
        // transform: ,
        // transformAlignment: ,
        // key: ,
        alignment: Alignment.center,
        width: 150,
        height: 150,
        // color: Colors.green,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 10,
                blurStyle: BlurStyle.inner,
                color: Colors.grey,
                offset: Offset(0, 0),
                spreadRadius: 50)
          ],
          // color: ,
          // image: DecorationImage(image: ),
          // shape: BoxShape.rectangle,
          // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          border: Border.all(),
          // gradient: const LinearGradient(
          //     colors: [Colors.red, Colors.blue],
          //     begin: Alignment.bottomRight,
          //     end: Alignment.topLeft)
          // backgroundBlendMode: ,
        ),
        // margin: ,
        // padding: ,
        child: Icon(Icons.smoke_free),
      )),
    );
  }
}
