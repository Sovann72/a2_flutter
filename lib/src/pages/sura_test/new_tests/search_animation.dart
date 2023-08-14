import 'package:flutter/material.dart';

class SearchWithAnimation extends StatefulWidget {
  const SearchWithAnimation({Key? key}) : super(key: key);
  @override
  State<SearchWithAnimation> createState() => _SearchWithAnimationState();
}

class _SearchWithAnimationState extends State<SearchWithAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late CurvedAnimation curve;
  FocusNode focus = FocusNode();

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // final width = MediaQuery.of(context).size.width;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _animation = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 50,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: _animation.value,
                  child: TextField(
                    focusNode: focus,
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                width: 30,
                height: 30,
                child: GestureDetector(
                  onTap: () {
                    if (!_isExpanded) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                    _isExpanded = !_isExpanded;
                    if (_isExpanded) {
                      focus.requestFocus();
                    } else {
                      focus.unfocus();
                    }
                  },
                  child: Icon(
                    // iconSize: 24,
                    _isExpanded ? Icons.close : Icons.search,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
