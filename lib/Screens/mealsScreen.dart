import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kupa/BLogic/Firebase/Firestore.dart';
import 'package:kupa/Models/cartItem.dart';
import 'package:kupa/Models/meals.dart';
import 'package:kupa/Screens/cart.dart';
import 'package:kupa/themes/AppColor.dart';

class MealsScreen extends StatefulWidget {
   MealsScreen({super.key,required this.meals});
  Meals meals;
  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  int index = 0;
  int indexColor = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          color: AppColors.thirdColor,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    count--;
                  });
                },
                icon: Icon(
                  Icons.plus_one,
                  color: AppColors.secondryColor,
                  size: 25.sp,
                )),
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.secondryColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                  child: Text(
                    count.toString(),
                    style:
                    TextStyle(fontSize: 25.sp, color: AppColors.thirdColor),
                  )),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                icon: Icon(
                  Icons.plus_one,
                  color: AppColors.secondryColor,
                  size: 25.sp,
                )),
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
              onTap: () {

              },
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    if (count > 0) {
                      cartitems.add(CartItem(
                        name: widget.meals.mealsname,
                        image: widget.meals.mealsImg1,
                        count: count,
                        singleprice: widget.meals.mealsPrice,
                        totalprice: widget.meals.mealsPrice * count,
                      ));

                      print(cartitems.length);
                    }
                    else{
                      SnackBar(content: Text("Please Add Quantity"));
                    }
                  });
                },
                child: Container(
                  width: 150.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.secondryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: AppColors.thirdColor, fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20.h,
          ),
          if (index == 0) ...{
            Container(
                width: MediaQuery.of(context).size.width,
                height: 270.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: NetworkImage(widget.meals.mealsImg1),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          radius: 15.w,
                          backgroundColor: AppColors.secondryColor,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.thirdColor,
                              size: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250.w,
                        ),
                        CircleAvatar(
                          radius: 15.w,
                          backgroundColor: AppColors.primaryColor,
                          child: IconButton(
                            onPressed: () {
                              FireStore.AddToWishList(
                                widget.meals.mealsname,
                                widget.meals.mealsDescription,
                                widget.meals.mealsPrice,
                                widget.meals.mealsOldPrice,
                                widget.meals.mealsImg1,
                                widget.meals.mealsImg2,
                                widget.meals.mealsImg3,
                              );
                              print("okey");
                            },
                            icon: Icon(
                              Icons.bookmark_add_outlined,
                              color: AppColors.thirdColor,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          },
          if (index == 1) ...{
            Container(
                width: MediaQuery.of(context).size.width,
                height: 270.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: NetworkImage(widget.meals.mealsImg2),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          radius: 15.w,
                          backgroundColor: AppColors.secondryColor,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.thirdColor,
                              size: 20.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          },
          if (index == 2) ...{
            Container(
                width: MediaQuery.of(context).size.width,
                height: 270.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: NetworkImage(widget.meals.mealsImg3),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          radius: 15.w,
                          backgroundColor: AppColors.secondryColor,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.thirdColor,
                              size: 20.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          },
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(widget.meals.mealsImg1),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(widget.meals.mealsImg2),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(widget.meals.mealsImg3),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
                width: 150.w,
                child: Text(
                  widget.meals.mealsname,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.thirdColor,
                      fontSize: 15.sp),
                )),
          ]),
          SizedBox(
            height: 30.h,
          ),
          Row(children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              widget.meals.mealsPrice.toString() + " \$",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.thirdColor,
                  fontSize: 20.sp),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              widget.meals.mealsOldPrice.toString() + " \$",
              style: TextStyle(color: Colors.black38, fontSize: 14.sp),
            ),
          ]),

          SizedBox(
            height: 20.h,
          ),
          Row(children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
                width: 300.w,
                child: Text(
                  widget.meals.mealsDescription,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.thirdColor,
                      fontSize: 15.sp),
                )),
          ]),
          SizedBox(
            height: 100.h,
          )
        ]),
      ),
    );
  }
}
