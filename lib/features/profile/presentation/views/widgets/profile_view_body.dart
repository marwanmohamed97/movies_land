import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/app_router.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/core/widgets/custom_button.dart';
import 'package:movies_land/features/auth/presentation/views/login_view.dart';
import 'package:movies_land/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:movies_land/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  CollectionReference names = FirebaseFirestore.instance.collection('names');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CustomAppBar(),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              child: Column(
                children: [
                  const ProfileImage(),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.paid,
                            size: 24,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'My Plan',
                            style: Styles.textStyle16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.mail,
                            size: 24,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'Messages',
                            style: Styles.textStyle16,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            radius: 14,
                            child: Text('3'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (kEmail != null) {
                            GoRouter.of(context).push(AppRouter.faviritesView);
                          }
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.favorite,
                              size: 24,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              'Favorites',
                              style: Styles.textStyle16,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.live_help,
                            size: 24,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'Support',
                            style: Styles.textStyle16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 53,
            ),
            kEmail == null
                ? CustomAuthButton(
                    onpressed: () {
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    hintText: 'LOG IN',
                    icon: Icons.login,
                  )
                : CustomAuthButton(
                    onpressed: () async {
                      await FirebaseAuth.instance.signOut();
                      kEmail = null;
                      setState(() {});
                      final pref = await SharedPreferences.getInstance();
                      pref.remove('path');
                    },
                    hintText: 'LOG OUT',
                    icon: Icons.logout,
                  )
          ],
        ),
      ),
    );
  }
}

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    Key? key,
    required this.onpressed,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onpressed;
  final String hintText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 61,
      child: TextButton(
        onPressed: onpressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                  width: 1, color: kPrimaryColor, style: BorderStyle.solid)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              hintText,
              style: Styles.textStyle14
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
