import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SpectrumPage extends StatefulWidget {
  const SpectrumPage({super.key});

  @override
  State<SpectrumPage> createState() => _SpectrumPageState();
}

class _SpectrumPageState extends State<SpectrumPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final Duration spectrumDuration = Duration(milliseconds: 600);
  late AnimationStatus animationState;

  @override
  void initState() {
    super.initState();
    animationState = AnimationStatus.forward;
    _animationController = AnimationController(
      vsync: this,
      duration: spectrumDuration,
    )..repeat(reverse: true);
    _animationController.addListener(() {
      // if(_animation.status )
      print('\x1B[37m${_animationController.status}');
      animationState = _animationController.status;
    });

    // _animation =
    //     CurvedAnimation(curve: Curves.linear, parent: _animationController);
  }

  @override
  void dispose() {
    _animationController.stop();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("spectrum")),
      body: Center(
        child: Container(
          height: 200,
          child: Column(
            children: [
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(border: Border.all()),
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  eachWaveWidget(80, Curves.bounceIn),
                  SizedBox(
                    width: 3,
                  ),
                  eachWaveWidget(80, Curves.bounceIn),
                  SizedBox(
                    width: 3,
                  ),
                  eachWaveWidget(80, Curves.bounceIn),
                  SizedBox(
                    width: 3,
                  ),
                  eachWaveWidget(80, Curves.bounceIn),
                  SizedBox(
                    width: 3,
                  ),
                  eachWaveWidget(80, Curves.bounceIn),
                  SizedBox(
                    width: 3,
                  ),
                  eachWaveWidget(80, Curves.bounceIn),
                  SizedBox(
                    width: 3,
                  ),
                  eachWaveWidget(80, Curves.bounceIn),
                  SizedBox(
                    width: 3,
                  ),
                  // eachWaveWidget(50, Curves.bounceInOut),
                  // SizedBox(
                  //   width: 3,
                  // ),
                  // eachWaveWidget(30, Curves.ease),
                  // SizedBox(
                  //   width: 3,
                  // ),
                  // eachWaveWidget(70, Curves.easeIn),
                  // SizedBox(
                  //   width: 3,
                  // ),
                  // eachWaveWidget(60, Curves.fastOutSlowIn),
                  // SizedBox(
                  //   width: 3,
                  // ),
                ]),
              ),
              IconButton(
                  onPressed: () {
                    if (_animationController.isAnimating) {
                      _animationController.stop();
                      _animationController.removeListener(() {});
                    } else {
                      _animationController.repeat(
                          period: spectrumDuration, reverse: true);
                      // _animationController.reverse();
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.check))
            ],
          ),
        ),
      ),
    );
  }

  Widget eachWaveWidget(double height, Curve curve) {
    final r = Random();
    final randomHeight = r.nextInt(20);
    final randomCurve = r.nextInt(10);

    return SizeTransition(
      sizeFactor: CurvedAnimation(curve: curve, parent: _animationController),
      axis: Axis.vertical,
      child: Container(
        width: 10,
        height: randomHeight.toDouble() * 5,
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.red),
      ),
    );
  }
}
