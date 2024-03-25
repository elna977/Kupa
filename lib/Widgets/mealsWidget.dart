import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kupa/Models/meals.dart';
import 'package:kupa/Screens/mealsScreen.dart';
import 'package:kupa/themes/AppColor.dart';

class MealsWidget extends StatefulWidget {
   MealsWidget({super.key,required this.meals});
  Meals meals;

  @override
  State<MealsWidget> createState() => _MealsWidgetState();
}

class _MealsWidgetState extends State<MealsWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MealsScreen(meals: widget.meals,)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.secondryColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(width: 2.w, color: AppColors.thirdColor)),
        width: 150.w,
        height: 300.h,
        child: Column(children: [
          Container(
            width: 130.w,
            height: 90.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.meals.mealsImg1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.meals.mealsname,
            style: TextStyle(color: AppColors.thirdColor, fontSize: 15.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.meals.mealsPrice.toString() + " \$",
            style: TextStyle(color: AppColors.thirdColor, fontSize: 18.sp),
          ),
        ]),
      ),


    );
  }
}
