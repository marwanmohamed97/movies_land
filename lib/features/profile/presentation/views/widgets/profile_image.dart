import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constats.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String? imageUrli;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            boxShadow: [
              BoxShadow(
                color: const Color(0xffB9FB5E).withOpacity(0.15),
                spreadRadius: 50,
                blurRadius: 60,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          child: CircleAvatar(
              radius: 100,
              backgroundColor: kPrimaryColor,
              child: FutureBuilder(
                builder: (context, snapshot) {
                  return Container(
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          kProfileImage ??
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                        ),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  );
                },
              )),
        ),
        GestureDetector(
          onTap: () async {
            ImagePicker imagePicker = ImagePicker();
            XFile? file =
                await imagePicker.pickImage(source: ImageSource.camera);

            Reference referenceRoot = FirebaseStorage.instance.ref();
            Reference referenceDirInmages = referenceRoot.child('images');
            Reference referenceImageToUpLoad =
                referenceDirInmages.child(kEmail!);
            if (file?.path == null) {
              return;
            }

            try {
              await referenceImageToUpLoad.putFile(File(file!.path));
            } catch (e) {}
          },
          child: const CircleAvatar(
            backgroundColor: kPrimaryColor,
            radius: 22,
            child: Icon(FontAwesomeIcons.penToSquare),
          ),
        )
      ],
    );
  }
}
