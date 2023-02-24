import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constats.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

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
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 100,
            backgroundColor: kPrimaryColor,
          ),
        ),
        const CircleAvatar(
          backgroundColor: kPrimaryColor,
          radius: 22,
          child: Icon(FontAwesomeIcons.penToSquare),
        )
      ],
    );
  }
}
