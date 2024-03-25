import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kupa/Screens/signInScreen.dart';
import 'package:kupa/Screens/signUpScreen.dart';
import 'package:kupa/themes/AppColor.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(children: [
        SizedBox(
          height: 30.h,
        ),
        Center(
          child: Image(image: NetworkImage("https://i.imgur.com/pvPFNIV.png")),
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 60.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Container(
                width: 100.w,
                height: 60.h,
                child: Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    )),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.thirdColor)),
              ),
            ).animate().fade(duration: 2.seconds),
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              child: Container(
                width: 100.w,
                height: 60.h,
                child: Center(
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 20.sp),
                    )),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.primaryColor)),
              ),
            ).animate().fade(duration: 2.seconds),

          ],
        ),
        SizedBox(height: 30.h,),
        SizedBox(
          width: 20.w,
        ),
        GestureDetector(
          onTap: () {
            setMode();
          },
          child: Container(
            width: 100.w,
            height: 60.h,
            child: Center(
                child: Text(
                  "theme",
                  style: TextStyle(
                      color: AppColors.primaryColor, fontSize: 20.sp),
                )),
            decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    width: 3.w, color: AppColors.primaryColor)),
          ),
        ).animate().fade(duration: 2.seconds),
      ]),
    );
  }
}
