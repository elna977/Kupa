import 'package:flutter/material.dart';
import 'package:kupa/themes/AppColor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _controller =PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                color: AppColors.primaryColor,
              ),
              Container(
                color: AppColors.secondryColor,
              ),
            ],
          ),
          Container(
            alignment: Alignment(0,0.75),
              child: SmoothPageIndicator(controller: _controller, count:2 ))
        ],
      ),
    );
  }
}
