import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/app_router.dart';
import 'package:movies_land/features/auth/presentation/views/login_view.dart';
import 'package:movies_land/features/auth/presentation/views/signup_view.dart';
import 'package:movies_land/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MoviesLand());
}

class MoviesLand extends StatelessWidget {
  const MoviesLand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        //textTheme: TextTheme()
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
