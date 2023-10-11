import 'dart:convert';

import 'package:a2_tutorial/src/provider/localization_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sura_flutter/sura_flutter.dart';
import 'package:sura_manager/sura_manager.dart';

class BenchmarkQuerySpeed extends StatefulWidget {
  const BenchmarkQuerySpeed({super.key});

  @override
  State<BenchmarkQuerySpeed> createState() => _BenchmarkQuerySpeedState();
}

class _BenchmarkQuerySpeedState extends State<BenchmarkQuerySpeed> {
  FutureManager loadingPage = FutureManager();

  void fetchData() async {
    await loadingPage.asyncOperation(() async {
      DateTime start = DateTime.now();
      Dio dio = Dio();

      dynamic enUs = await dio
          .getUri(Uri.parse(
              "https://raw.githubusercontent.com/Sovann72/config/main/en_us.json"))
          .then((response) {
        return jsonDecode(response.data);
      });

      dynamic kmKh = await dio
          .getUri(Uri.parse(
              "https://raw.githubusercontent.com/Sovann72/config/main/km_kh.json"))
          .then((response) {
        return jsonDecode(response.data);
      });

      DateTime end = DateTime.now();
      debugPrint(
          "duration to benchmark: ${end.difference(start).inMilliseconds}");
      final localizationProvider =
          Provider.of<LocalizationProvider>(context, listen: false);

      localizationProvider.setKmKhLocale(kmKh);
      localizationProvider.setEnUsLocale(enUs);
      return enUs;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => fetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("benchmark query speed")),
      body: FutureManagerBuilder(
        futureManager: loadingPage,
        ready: (context, data) {
          // debugPrint("runtime type: ${data.runtimeType}");
          final localizationProvider =
              Provider.of<LocalizationProvider>(context);
          return Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(localizationProvider.kmKh.toString()),
                  SpaceY(100),
                  Text(localizationProvider.enUs.toString())
                ],
              ));
        },
      ),
    );
  }
}
