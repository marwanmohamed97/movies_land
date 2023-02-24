import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/core/widgets/custom_button.dart';
import 'package:movies_land/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:movies_land/features/profile/presentation/views/widgets/profile_image.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

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
                  const Text(
                    'Matthew',
                    style: Styles.textStyle34,
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
                      Row(
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
            CustomButton(
              isSginOut: true,
              textColor: kPrimaryColor,
              buttonContent: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'SIGN OUT',
                    style: Styles.textStyle14.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
