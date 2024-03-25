import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kupa/BLogic/Firebase/Firestore.dart';
import 'package:kupa/Screens/Navi.dart';
import 'package:kupa/themes/AppColor.dart';
import 'package:firebase_storage/firebase_storage.dart';


class SignUpUserInfoScreen extends StatefulWidget {
  const SignUpUserInfoScreen({super.key});

  @override
  State<SignUpUserInfoScreen> createState() => _SignUpUserInfoScreenState();
}

class _SignUpUserInfoScreenState extends State<SignUpUserInfoScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  String  image="";
  bool getimage = false;
  File? file;
  String url = "";

  UploadImage_gallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        file = File(image.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref(imgname);
      await ref.putFile(file!, metadata);

      url = await ref.getDownloadURL();
    }
  }

  UploadImage_camera() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        file = File(image!.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref(imgname);
      await ref.putFile(file!, metadata);

      url = await ref.getDownloadURL();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    age.dispose();
    phone.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: color1,
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        SizedBox(height: 30.h,),

        Center(
          child: GestureDetector(
            onTap: ()async{
              //image = await UploadImage_gallery();
            },
            child: CircleAvatar(
                radius: 60.r,
                backgroundImage: NetworkImage(image)),
          ),),

        SizedBox(height: 30.h,),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: name,
            decoration: InputDecoration(
              label: Text('Full name',style: TextStyle(color: AppColors.secondryColor),),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondryColor,width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(Icons.person,color: AppColors.secondryColor,),
            ),
          ),
        ),
        SizedBox(height: 40.h,),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: phone,
            decoration: InputDecoration(
              label: Text('Phone Number',style: TextStyle(color: AppColors.secondryColor),),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor,width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(Icons.phone_callback_outlined,color: AppColors.secondryColor,),
            ),
          ),
        ),
        SizedBox(height: 40.h,),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: age,
            decoration: InputDecoration(
              label: Text('Age',style: TextStyle(color: AppColors.secondryColor),),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondryColor,width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(CupertinoIcons.arrowshape_turn_up_right,color: AppColors.secondryColor,),
            ),
          ),
        ),
        SizedBox(height: 40.h,),
        ElevatedButton(onPressed: (){
          try {
            FireStore.AddUserInfo(
                name.text,
                age.text,
                phone.text,
              image
            );

            Navigator.push(context, MaterialPageRoute(builder: (context) => Navi()));

          } catch (e) {
            print(e);
          }




        }, child: Text('Submit',style: TextStyle(fontSize: 15.sp,color: AppColors.primaryColor),),style: ElevatedButton.styleFrom(
          primary: AppColors.secondryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),),
      ]),
    );
  }
}
