import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/core/ulits/service_locator.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_land/features/home/presentation/manager/movies_land_cubit/movies_land_cubit.dart';

import '../../../../../core/ulits/styles.dart';
import 'custom_app_bar.dart';
import 'custom_search_button.dart';

import 'custom_movie_item.dart';

class HomeMovieView extends StatelessWidget {
  const HomeMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: const [
                SizedBox(
                  height: 32,
                ),
                CustomAppBar(),
                SizedBox(
                  height: 38,
                ),
                CustomSearchButton(),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending',
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 24,
                ),
                BlocProvider(
                  create: (context) =>
                      MoviesLandCubit(getIt.get<HomeRepoImpl>())
                        ..fetchTrendingMovies(),
                  child: const CustomMovieItem(),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Playing Now',
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocProvider(
                  create: (context) =>
                      MoviesLandCubit(getIt.get<HomeRepoImpl>())
                        ..fetchNowPlayingMovies(),
                  child: const CustomMovieItem(),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Top Rated',
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocProvider(
                  create: (context) =>
                      MoviesLandCubit(getIt.get<HomeRepoImpl>())
                        ..fetchTopRatedMovies(),
                  child: const CustomMovieItem(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
