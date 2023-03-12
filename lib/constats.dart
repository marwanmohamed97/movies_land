import 'package:flutter/material.dart';

const kButtonColor = Color(0xffB1F35D);
const kPrimaryColor = Color(0xff9EF161);
const kBackgroundColor = Color(0xff111215);
String? kEmail;
String? kProfileImage;

String imageUrlMaker({String? imageUrl}) {
  if (imageUrl != null) {
    return 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2$imageUrl';
  } else {
    return 'https://t3.ftcdn.net/jpg/05/38/52/48/360_F_538524834_KTWCegIa69mIWDLVx6Sc6tdkW6beiMBR.jpg';
  }
}
