import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kupa/Models/restaurant.dart';
import 'package:kupa/Widgets/restaurantWidget.dart';
import 'package:kupa/themes/AppColor.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<restaurantclass> list = [
    restaurantclass(
        name: "Karam El sham",
        image:
        "https://i.imgur.com/HtD5b3f.png"),
    restaurantclass(
        name: "bazooka",
        image:
        "https://i.imgur.com/JnhHi89.jpeg"),
    restaurantclass(
        name: "heart attack",
        image:
        "https://i.imgur.com/OlTCjxl.png"),
    restaurantclass(
        name: "buffalo burger",
        image:
        "https://i.imgur.com/o3Dh0xK.jpeg"),
  ];
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
                Text("Menu",style: TextStyle(
                  color: AppColors.quartColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 80.w,),
                IconButton(onPressed: (){},
                    icon:Icon(Icons.notifications_none_outlined,
                    color:AppColors.quartColor,size: 25.sp,)),
              ],
            ),
            SizedBox(height: 60.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 30.w,),
                Text("Special For You",style:TextStyle(
                  color: AppColors.thirdColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp
                )),
              ],
            ),
            SizedBox(height: 20.h,),
            Center(
              child: Text("Restaurants",style:TextStyle(
                  color: AppColors.quartColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp
              )),
            ),
            SizedBox(height: 40.h,),
            Container(
                height: 350,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RestaurantWidget(
                        restaurant: list[index],
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
