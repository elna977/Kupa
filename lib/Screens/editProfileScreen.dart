import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kupa/BLogic/Firebase/Firestore.dart';
import 'package:kupa/themes/AppColor.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  static final auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String  image="";
  bool getimage = false;
  File? file;
  String url = "mohamed";

  UploadImage_gallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

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

  Future<void> GetUserInfo() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          nameController.text = snapshot.data()!['username'];
          ageController.text = snapshot.data()!['age'];
          phoneController.text = snapshot.data()!['phonenumber'];
          image =snapshot.data()!['image'];
        });
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: AppColors.thirdColor, fontSize: 20.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                try {
                  FireStore.AddUserInfo(nameController.text, ageController.text,
                      phoneController.text,image);
                  Fluttertoast.showToast(
                      msg: "Profile Updated",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColors.thirdColor,
                      textColor: Colors.white,
                      fontSize: 16.0);



                } catch (e) {
                  print(e);
                }
              },
              icon: Icon(
                Icons.save,
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
      body: Column(children: [
        SizedBox(
          height: 30.h,
        ),
        Center(
          child: GestureDetector(
            onTap: ()async{
              image = await UploadImage_gallery();
            },
            child: CircleAvatar(
                radius: 60.r,
                backgroundImage: AssetImage(image),),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              label: Text(
                'Full name',
                style: TextStyle(color: AppColors.thirdColor),
              ),
              border: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.thirdColor, width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.thirdColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: phoneController,
            decoration: InputDecoration(
              label: Text(
                'Phone Number',
                style: TextStyle(color: AppColors.thirdColor),
              ),
              border: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.thirdColor, width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(
                Icons.phone_callback_outlined,
                color: AppColors.thirdColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: ageController,
            decoration: InputDecoration(
              label: Text(
                'Age',
                style: TextStyle(color: AppColors.thirdColor),
              ),
              border: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.thirdColor, width: 2.w),
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: Icon(
                CupertinoIcons.arrowshape_turn_up_right,
                color: AppColors.thirdColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
      ]),
    );
  }
}
