import 'package:flutter/material.dart';

import '../../../../../../constats.dart';
import '../../../../../../core/ulits/styles.dart';

class LiveChannels extends StatelessWidget {
  const LiveChannels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            width: double.infinity,
            height: 127,
            decoration: BoxDecoration(
              color: index == 0 ? kPrimaryColor : null,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Image.asset('assets/images/channel_logo.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    index == 0
                        ? Text(
                            '9 AM - 10 AM',
                            style: Styles.textStyle14.copyWith(
                              color: index == 0 ? Colors.black : null,
                            ),
                          )
                        : Text(''),
                    Text(
                      'Morning News NOW',
                      style: Styles.textStyle16.copyWith(
                          color: index == 0 ? Colors.black : null,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'S3 E36',
                      style: Styles.textStyle14.copyWith(
                        color: index == 0 ? Colors.black.withOpacity(.6) : null,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
