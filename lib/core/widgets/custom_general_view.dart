import 'package:flutter/material.dart';

class CustomGeneralView extends StatelessWidget {
  const CustomGeneralView(
      {Key? key, required this.widget, this.backgroundColor = false})
      : super(key: key);

  final Widget widget;
  final bool backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111215),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                Image.asset('assets/images/splash_background.png'),
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: backgroundColorSignUp(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: MediaQuery.of(context).size.width * .25,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xffB9FB5E).withOpacity(0.15),
                            spreadRadius: 120,
                            blurRadius: 100,
                            blurStyle: BlurStyle.normal,
                            offset: const Offset(0, -80))
                      ],
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Logo.png'),
                        widget,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Color> backgroundColorSignUp() {
    if (backgroundColor == false) {
      return [
        Colors.transparent,
        Colors.transparent,
        Colors.transparent,
        Colors.transparent,
        Colors.transparent,
        Colors.black.withOpacity(.8),
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black,
      ];
    } else {
      return [
        Colors.transparent,
        Colors.transparent,
        Colors.black.withOpacity(.8),
        Colors.black,
        Colors.black,
        Colors.black,
      ];
    }
  }
}
