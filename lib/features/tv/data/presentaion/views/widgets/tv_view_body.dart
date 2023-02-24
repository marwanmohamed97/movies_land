import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/features/tv/data/presentaion/views/widgets/tv_live_options.dart';

import '../../../../../home/presentation/views/widgets/episodes_of_movie.dart';
import '../../../../../home/presentation/views/widgets/over_view_movie.dart';
import '../../../../../home/presentation/views/widgets/play_movie_section.dart';
import '../../../../../home/presentation/views/widgets/season_section.dart';

class TvViewBody extends StatelessWidget {
  const TvViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset('assets/images/tv_background.png'),
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height ,
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(.8),
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   height: MediaQuery.of(context).size.height,
                  //   color: Colors.black,
                  // ),
                ],
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 217,
                  ),
                  TvLiveOptions(),
                  SizedBox(
                    height: 32,
                  ),
                  Expanded(child: LiveChannels())
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
