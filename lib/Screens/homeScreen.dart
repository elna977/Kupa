import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kupa/BLogic/Firebase/Auth.dart';
import 'package:kupa/Models/meals.dart';
import 'package:kupa/Screens/mealsScreen.dart';
import 'package:kupa/Screens/restaurantMenu.dart';
import 'package:kupa/Screens/splashScreen.dart';
import 'package:kupa/Widgets/mealsWidget.dart';
import 'package:kupa/Widgets/restaurantWidget.dart';
import 'package:kupa/themes/AppColor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width:130.w),
            Text("Kupa",style: TextStyle(
                color: AppColors.thirdColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(width: 60.w,),
            IconButton(
              icon: Icon(
                Icons.search,
                color: AppColors.thirdColor,
                size: 20.sp,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: AppColors.thirdColor,
                size: 20.sp,
              ),
              onPressed: () {
                Authentication.signOut();
                if(FirebaseAuth.instance.currentUser==null){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SplashScreen()));
                }
              },
            ),
          ],
        ),
            SizedBox(height: 30.h,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>RestaurantMenuScreen (
                            name:"bazooka"
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100.h,
                  color: AppColors.thirdColor,
                  child: Column(
                    children: [
                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          SizedBox(width: 20.w,),
                          Column(
                            children: [
                              Text("Daily Offers",style: TextStyle(
                                color: AppColors.quartColor,
                                fontSize: 30.sp
                              ),),
                              SizedBox(height: 5.h,),
                              Text("Bazooka Offers",style: TextStyle(
                                  color: AppColors.quartColor,
                                  fontSize: 15.sp
                              ),),
                            ],
                          ),
                          SizedBox(width: 30.w,),
                          SizedBox(
                              width: 70.w,
                              height: 90.h,
                              child: Image(image: NetworkImage("https://i.imgur.com/JnhHi89.jpeg")))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "Most Sale of bazooka",
                  style: TextStyle(
                      color: AppColors.quartColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
                height: 230.h,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("bazooka")
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:MealsWidget(
                                meals: Meals(
                                  mealsImg1: snapshot.data!.docs[index]["img1"],
                                  mealsImg2: snapshot.data!.docs[index]["img2"],
                                  mealsImg3: snapshot.data!.docs[index]["img3"],
                                  mealsname: snapshot.data!.docs[index]["name"],
                                  mealsPrice: snapshot.data!.docs[index]["price"] ,
                                  mealsOldPrice: snapshot.data!.docs[index]["oldprice"] ,
                                  mealsDescription: snapshot.data!.docs[index]["des"],
                                  mealsCategory: '',
                                )
                            )
                            );
                      },
                    );
                  }),
                )),
            SizedBox(height: 30.h,),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "Most Sale of bazooka",
                  style: TextStyle(
                      color: AppColors.quartColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
                height: 230.h,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("buffalo burger")
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:MealsWidget(
                                meals: Meals(
                                  mealsImg1: snapshot.data!.docs[index]["img1"],
                                  mealsImg2: snapshot.data!.docs[index]["img2"],
                                  mealsImg3: snapshot.data!.docs[index]["img3"],
                                  mealsname: snapshot.data!.docs[index]["name"],
                                  mealsPrice: snapshot.data!.docs[index]["price"] ,
                                  mealsOldPrice: snapshot.data!.docs[index]["oldprice"] ,
                                  mealsDescription: snapshot.data!.docs[index]["des"],
                                  mealsCategory: '',
                                )
                            )
                        );
                      },
                    );
                  }),
                )),
        ],
        ),
      ),
    );
  }
}
