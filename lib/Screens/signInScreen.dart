import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kupa/BLogic/Firebase/Auth.dart';
import 'package:kupa/Screens/Navi.dart';
import 'package:kupa/Screens/signUpScreen.dart';
import 'package:kupa/Screens/signUpUserInfo.dart';
import 'package:kupa/themes/AppColor.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final auth=FirebaseAuth.instance;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        SizedBox(
          height: 50.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 40.w,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.thirdColor,
                )),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 40.w,
            ),
            Text(
              "Sign In",
              style: TextStyle(
                  color: AppColors.thirdColor,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onChanged: (value) {
              email = value;
            },
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Enter Your Email",
              labelText: 'Email',
              labelStyle: TextStyle(color: AppColors.thirdColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.thirdColor),
              ),
              prefixIcon: Icon(
                Icons.email,
                color: AppColors.thirdColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.thirdColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onChanged: (value) {
              password = value;

            },
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Your Password",
              labelText: 'Password',
              labelStyle: TextStyle(color: AppColors.thirdColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.thirdColor),
              ),
              prefixIcon: Icon(
                Icons.password,
                color: AppColors.thirdColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.thirdColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 75.w,
            ),
            GestureDetector(
              onTap: () {
                try {

                  if(email==null||password==null){
                    setState(() {
                      SnackBar(content: Text("Please Enter Your Email And Password"));

                    });
                  }
                  else{
                    Authentication.Login(_emailController.text.trim(),
                        _passwordController.text.trim());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Navi()));
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                width: 200.w,
                height: 60.h,
                child: Center(
                    child: Text(
                      "SignIn",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    )),
                decoration: BoxDecoration(
                    color: AppColors.thirdColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.thirdColor)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 75.w,
            ),
            GestureDetector(
              onTap: () {
                try {
                  Authentication.signInWithGoogle();
                  if(auth.currentUser!=null){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Navi()));

                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                width: 200.w,
                height: 60.h,
                child: Center(
                    child: Text(
                      "SignIn With Google",
                      style: TextStyle(
                          color: AppColors.thirdColor, fontSize: 20.sp),
                    )),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        width: 3.w, color: AppColors.thirdColor)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 35.w,
            ),
            Text(
              "Not Have An Account Yet?",
              style:
              TextStyle(color: AppColors.thirdColor, fontSize: 15.sp),
            ),
            SizedBox(
              width: 5.w,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  "create one",
                  style: TextStyle(
                      color: AppColors.thirdColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ]),
    );
  }
}
