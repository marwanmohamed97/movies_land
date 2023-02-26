import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/api_service.dart';
import 'package:movies_land/core/ulits/app_router.dart';
import 'package:movies_land/core/ulits/service_locator.dart';
import 'package:movies_land/features/auth/presentation/views/login_view.dart';
import 'package:movies_land/features/auth/presentation/views/signup_view.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_land/features/home/presentation/views/manager/movie_trailer_cubit/movie_trailer_cubit.dart';
import 'package:movies_land/features/home/presentation/views/manager/movies_land_cubit/movies_land_cubit.dart';
import 'package:movies_land/features/splash/presentation/views/splash_view.dart';

void main() {
  setupServiceLocator();
  runApp(const MoviesLand());
}

class MoviesLand extends StatelessWidget {
  const MoviesLand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MoviesLandCubit(getIt.get<HomeRepoImpl>())..fetchTrendingMovies(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
