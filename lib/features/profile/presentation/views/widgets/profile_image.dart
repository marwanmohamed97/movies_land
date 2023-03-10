import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../constats.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String? imageUrli;
  String? imageUrl;

  Future<String> getimage() async {
    final ref = FirebaseStorage.instance.ref().child('images/$kEmail');

    var imageUrl = await ref.getDownloadURL();
    print('image is  $imageUrl');

    return imageUrl;
  }

  @override
  void initState() {
    getimage();
    super.initState();
  }

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
                future: getimage(),
                builder: (context, snapshot) {
                  return Container(
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(snapshot.data ??
                              'https://i.imgur.com/sUFH1Aq.png')
                          // image: imageUrl == null
                          //     ? NetworkImage(
                          //         getimage(email: kEmail!).toString(),
                          //       )
                          //     : const NetworkImage('https://i.imgur.com/sUFH1Aq.png'),
                          ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  );
                },
              )),
        ),
        GestureDetector(
          onTap: () async {
            // uploadImage();
            ImagePicker imagePicker = ImagePicker();
            XFile? file =
                await imagePicker.pickImage(source: ImageSource.camera);
            print('${file?.path}');

            Reference referenceRoot = FirebaseStorage.instance.ref();
            Reference referenceDirInmages = referenceRoot.child('images');
            Reference referenceImageToUpLoad =
                referenceDirInmages.child(kEmail!);
            if (file?.path == null) {
              return;
            }

            try {
              await referenceImageToUpLoad.putFile(File(file!.path));
              imageUrl = await referenceImageToUpLoad.getDownloadURL();
              print('image URl is ===== $imageUrl');
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

  uploadImage() async {
    final firebaseStorage = FirebaseStorage.instance;
    final imagePicker = ImagePicker();
    PickedFile image;
    //Check Permissions
    await Permission.photos.request();

    // _checkPermission(context);
    var permissionStatus = await Permission.photos.status;

    if (await Permission.photos.request().isGranted) {
      //Select Image
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      // final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
      var file = File(image!.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot =
            await firebaseStorage.ref().child('images/imageName').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
}
