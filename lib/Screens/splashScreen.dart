import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kupa/Screens/Navi.dart';
import 'package:kupa/Screens/homeScreen.dart';
import 'package:kupa/Screens/welcomScreen.dart';
import 'package:kupa/themes/AppColor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: AppColors.primaryColor,
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: Image.network("https://i.imgur.com/pvPFNIV.png"),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        nextScreen: FirebaseAuth.instance.currentUser == null
            ? WelcomeScreen()
            : Navi(),
      ),
    );
  }
}
