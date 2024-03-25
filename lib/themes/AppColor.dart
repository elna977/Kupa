import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Color  ?color1;
bool isdark =false;
class AppColors{
  static final primaryColor =Color.fromRGBO(25, 66, 18, 1.0);
  static final secondryColor =Color.fromRGBO(196, 212, 172, 1);
  static final thirdColor =Color.fromRGBO(28, 125, 12, 1.0);
  static final quartColor =Color.fromRGBO(4, 14, 3, 1.0);

}
setMode(){
  isdark !=isdark;
  isdark? color1 =Colors.black:color1 =Colors.white;
}