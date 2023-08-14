import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sura_flutter/sura_flutter.dart';

class TranslateAnimation extends StatefulWidget {
  const TranslateAnimation({super.key});

  @override
  State<TranslateAnimation> createState() => _TranslateAnimationState();
}

class _TranslateAnimationState extends State<TranslateAnimation> {
  List<String> url = [
    "https://cdn.mos.cms.futurecdn.net/9QTpESGBXa32D29J77VR3d-1200-80.jpg",
    "https://code.energy/wp-content/uploads/coder-at-night.jpg",
    "https://blog.risingstack.com/wp-content/uploads/2022/03/homeless-programmer-1-1024x681.jpeg",
    "https://i.ytimg.com/vi/wKoHS2aKSUI/maxresdefault.jpg"
  ];

  PageController? pageController;
  int currentIndex = 0;
  int? prevIndex;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Translate Animation")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 200,
          width: size.width,
          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                prevIndex = currentIndex;
                currentIndex = index;
              });
            },
            children: [
              ...List.generate(
                  url.length,
                  (index) => Banner(
                        url: url[index],
                      ))
            ],
          ),
        ),
        SpaceY(10),
        Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.pink)),

            width: size.width,
            child: AllIndicator(
              onTap: (index) {
                pageController!.animateToPage(index,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
                setState(() {
                  index = currentIndex;
                });
              },
              url: url,
              // prevIndex: prevIndex,
              currentIndex: currentIndex,
            ))
        // Container(
        //   height: 50,
        //   width: size.width,
        //   decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
        //   child: Center(child: ,),
        // )
      ]),
    );
  }
}

class Banner extends StatelessWidget {
  final String url;
  const Banner({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Image.network(url, fit: BoxFit.cover),
    );
  }
}

class Indicator extends StatelessWidget {
  final void Function(int) onTap;
  final int index;
  const Indicator({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFD8D8D8)),
        child: Center(
            child: Text(
          index.toString(),
          style: TextStyle(color: Colors.blue),
        )),
      ),
    );
  }
}

class AllIndicator extends StatefulWidget {
  final void Function(int index) onTap;
  final List<String> url;
  // final int? prevIndex;
  final int currentIndex;
  const AllIndicator(
      {super.key,
      required this.url,
      required this.onTap,
      // this.prevIndex,
      required this.currentIndex});

  @override
  State<AllIndicator> createState() => _AllIndicatorState(currentIndex);
}

class _AllIndicatorState extends State<AllIndicator> {
  _AllIndicatorState(this.currentIdx);

  int currentIdx;
  List<String> get url => widget.url;
  // List<double> offset = [];
  late double offset;

  @override
  void didUpdateWidget(covariant AllIndicator oldWidget) {
    if (currentIdx != widget.currentIndex) {
      // List<double> temp = [];
      if (currentIdx < widget.currentIndex) {
        //forward
        // temp = offset.map((e) => e - 40).toList();
        offset = offset - 40;
      } else if (currentIdx > widget.currentIndex) {
        //backward
        // temp = offset.map((e) => e + 40).toList();
        offset = offset + 40;
      } else {
        // temp = offset;
        //doesn't move
      }
      setState(() {
        // offset = temp;
        currentIdx = widget.currentIndex;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // offset = [...List.generate(url.length, (index) => index * 40)];
    offset = 90 - 30;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Transform.translate(
          offset: Offset(offset, 0),
          child: Container(
            width: 180,
            height: 50,
            // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    widget.url.length,
                    (index) => Row(
                          children: [
                            Indicator(
                              index: index,
                              onTap: (index) {
                                widget.onTap(index);
                              },
                              // currentIndex: widget.currentIndex,
                            ),
                            SpaceX(10)
                          ],
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
