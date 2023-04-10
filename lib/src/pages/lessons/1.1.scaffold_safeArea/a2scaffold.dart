import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 100,
          height: 400,
          child: const Text(
            "sdklafkjlnlasddfnsjasdldfsadsfjladflsjdfsdfsakajhkkjlahfshkjdfkhjadsadskhjadfs",
            style: TextStyle(color: Colors.red),
            maxLines: 3,
          ),
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Center(child: Text('hello world')),
    //   bottomNavigationBar: Container(child: FlutterLogo()),
    //   floatingActionButton: IconButton(
    //       icon: Icon(Icons.abc),
    //       onPressed: () {
    //         print('hello world');
    //       }),
    //   appBar: AppBar(
    //     // +++deprecated
    //     // ----------------
    //     // backwardsCompatibility: ,
    //     // brightness: ,
    //     // textTheme: ,

    //     // +++never used or barely use
    //     // ----------------
    //     // notificationPredicate: (notification) {},
    //     // systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light,    statusBarColor: Colors.pink, statusBarIconBrightness: Brightness.dark, systemNavigationBarColor: Colors.deepPurple, ),
    //     // excludeHeaderSemantics: true,
    //     // foregroundColor: Colors.blue,
    //     // iconTheme: IconThemeData.fallback(),
    //     // primary: false,
    //     // scrolledUnderElevation: 2,
    //     // shadowColor: Colors.grey[200],
    //     // shape: RoundedRectangleBorder(),
    //     // surfaceTintColor: Colors.green,
    //     // titleSpacing: 10,
    //     // titleTextStyle: TextStyle(color: Colors.red),
    //     // toolbarHeight: 100,
    //     // toolbarOpacity: 1,
    //     // toolbarTextStyle: TextStyle(fontSize: 16),
    //     // actionsIconTheme: const IconThemeData.fallback(),
    //     // elevation: 100,
    //     // backgroundColor: Colors.white,
    //     // foregroundColor: Colors.black,

    //     // +++another lesson
    //     // -------------------
    //     // flexibleSpace: ,

    //     // used often
    //     title: const Text("appBar"),
    //     actions: [
    //       Text("actions"),
    //       Icon(Icons.smoke_free),
    //     ],
    //     // automaticallyImplyLeading: true,
    //     bottom: PreferredSize(
    //         preferredSize: Size.fromHeight(100),
    //         child: Container(
    //             decoration: BoxDecoration(color: Colors.white),
    //             height: 100,
    //             child: Center(child: Text("bottom")))),
    //     // bottomOpacity: 0.4,
    //     centerTitle: true,
    //     automaticallyImplyLeading: true,
    //     leading: GestureDetector(
    //         onTap: () {
    //           // print('\x1B[37m hello this is leading');
    //           Navigator.pop(context);
    //         },
    //         child: const Icon(Icons.arrow_back_ios_new_rounded)),
    //     leadingWidth: 50,
    //   ),
    // );
  }
}
