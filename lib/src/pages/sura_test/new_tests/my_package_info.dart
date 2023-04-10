// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:package_config/package_config.dart';
import "package:flutter/services.dart" as s;
import 'package:yaml/yaml.dart';
// import 'package:dart_config/default_server.dart';

class MyPackageInfo extends StatefulWidget {
  const MyPackageInfo({super.key});

  @override
  State<MyPackageInfo> createState() => _MyPackageInfoState();
}

class _MyPackageInfoState extends State<MyPackageInfo> {
  late PackageInfo packageInfo;
  late String appName;
  late String packageName;
  late String version;
  late String buildNumber;

  Future<void> getPackageInfo() async {
    // final conf = await loadPackageConfig(File("../../../pubspec.yaml"));
    // final yamlPackage = await s.rootBundle.loadString("pubspec.yaml");
    // final yamlPackage = await s.
    // final mapYaml = loadYaml(yamlPackage);
    // print('\x1B[32mmapYaml: ${mapYaml}');

    // print('\x1B[32mconf${conf.version}');

    packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;

    print('\x1B[33mappName: ${appName}');
  }

  @override
  void initState() {
    getPackageInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("my package info")),
      body: Center(
          child: Container(
        width: 250,
        height: 160,
        decoration: BoxDecoration(border: Border.all()),
        // child: Column(
        //   children: [],
        // ),
        child: FutureBuilder(
            future: getPackageInfo(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'appName: ${appName}',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'packageName: ${packageName}',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'version: ${version}',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'buildNumber: ${buildNumber}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }
              return const Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator()));
            }),
      )),
    );
  }
}
