import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kupa/BLogic/Firebase/Firestore.dart';
import 'package:kupa/Models/user.dart';
import 'package:kupa/Screens/editProfileScreen.dart';
import 'package:kupa/themes/AppColor.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel?user;
  static final auth = FirebaseAuth.instance;
  String name = "";
  String age = "";
  String phone = "";
  String image="";



  Future<void> GetUserInfo() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!['username'];
          age = snapshot.data()!['age'];
          phone = snapshot.data()!['phonenumber'];
          image =snapshot.data()!['image'];
        });

        return user;
      } else {
        print('No data');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserInfo();
    //getInfo();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: AppColors.thirdColor),
        ),

        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
              },
              icon: Icon(
                Icons.edit,
                color: AppColors.thirdColor,
                size: 15.sp,
              ))
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.thirdColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: CircleAvatar(
                radius: 60.r,
                backgroundImage:
                NetworkImage(image)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // name,
                name,
                style: TextStyle(
                    color: AppColors.thirdColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                phone,
                style:
                TextStyle(color: AppColors.thirdColor, fontSize: 15.sp),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: AppColors.thirdColor,
                width: MediaQuery.sizeOf(context).width,
                height: 150.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 40.w,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          age,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 15.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Total Orders",
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 15.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          "1800\$",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Total Price",
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 15.sp),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
