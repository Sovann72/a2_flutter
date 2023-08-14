import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:soriya_flutter/soriya_flutter.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with OnboardingPageMixin, SingleTickerProviderStateMixin {
  @override
  String get header => "THE BLUES";

  @override
  String get secHeader => "CHELSEAAAA";

  @override
  Widget get img => Image.network(
        "https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/285px-Chelsea_FC.svg.png",
        width: 150,
        height: 150,
      );

  @override
  String get content =>
      "Chelsea Football Club is an English professional football club based in Fulham, West London. Founded in 1905, they play their home games at Stamford Bridge.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: layout(
      MediaQuery.of(context).size, 1,
      backgroundColor: Colors.white,
      textColor: const Color(
        0xFF034694,
      ),
      // backgroundImage: DecorationImage(
      //     image: NetworkImage(
      //   "https://e0.pxfuel.com/wallpapers/51/802/desktop-wallpaper-iphone-xs-max-chelsea-t-chelsea-fc-thumbnail.jpg",
      // ))
    ));
  }
}
