import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kupa/Models/meals.dart';
import 'package:kupa/Screens/mealsScreen.dart';
import 'package:kupa/themes/AppColor.dart';

class RestaurantMenuScreen extends StatefulWidget {
   RestaurantMenuScreen({super.key,required this.name});
  String name;
  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            style: TextStyle(color: AppColors.thirdColor),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.thirdColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColors.secondryColor,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream:FirebaseFirestore.instance.collection(widget.name).snapshots() ,
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>
                             MealsScreen(
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
                         ));


                      },
                      child: ListTile(
                        leading: Container(
                          child: Image(
                            image: NetworkImage(snapshot.data!.docs[index]["img1"]),
                          ),
                        ),
                        title: Text(snapshot.data!.docs[index]["name"]),
                        subtitle: Text("${snapshot.data!.docs[index]["price"].toString()}\$ " ),

                      ),
                    ),

                  );
                },
              );
            }
          },
        )
    );
  }
}
