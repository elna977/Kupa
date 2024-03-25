import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kupa/Models/restaurant.dart';
import 'package:kupa/Screens/restaurantMenu.dart';


class RestaurantWidget extends StatefulWidget {
   RestaurantWidget({super.key, required this.restaurant});
   restaurantclass restaurant;
  @override
  State<RestaurantWidget> createState() => _RestaurantWidgetState();
}

class _RestaurantWidgetState extends State<RestaurantWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>RestaurantMenuScreen (
                    name:widget.restaurant.name
                )));
      },
      child: Container(
        width: 100.w,
        height: 80,
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.restaurant.image),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              widget.restaurant.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
