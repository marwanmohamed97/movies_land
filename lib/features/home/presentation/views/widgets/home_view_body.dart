import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_land/features/downloads/presentaion/views/downloads_view.dart';
import 'package:movies_land/features/profile/presentation/views/profile_view.dart';
import 'package:movies_land/features/search/presentation/views/search_view.dart';
import 'package:movies_land/features/tv/data/presentaion/views/tv_view.dart';
import 'home_movie_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final widgetsOptions = const [
    HomeMovieView(),
    TvView(),
    DownloadsView(),
    ProfileView(),
  ];
  final listOfIcons = [
    FontAwesomeIcons.houseChimneyWindow,
    FontAwesomeIcons.youtube,
    FontAwesomeIcons.download,
    FontAwesomeIcons.circleUser,
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 108,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(seconds: 1),
                      height: 30,
                      width: 30,
                      decoration: index == currentIndex
                          ? BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xffB9FB5E).withOpacity(0.15),
                                  spreadRadius: 18,
                                  blurRadius: 30,
                                  blurStyle: BlurStyle.normal,
                                )
                              ],
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(seconds: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: index == currentIndex ? 2 : 0,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth / 4,
                    alignment: Alignment.center,
                    child: Icon(
                      listOfIcons[index],
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: widgetsOptions.elementAt(currentIndex),
      ),
    );
  }
}
