import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/service_locator.dart';
import 'package:movies_land/core/widgets/custom_error_view.dart';
import 'package:movies_land/core/widgets/custom_text_field.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_land/features/home/presentation/manager/movie_actors_cubit/movie_actros_cubit.dart';
import 'package:movies_land/features/home/presentation/views/widgets/recommended_movies.dart';
import 'package:movies_land/features/home/presentation/views/widgets/recommended_movies_body.dart';
import 'package:movies_land/features/profile/presentation/manager/search_movie_cubit/search_movie_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: TextField(
                  onChanged: ((value) {
                    BlocProvider.of<SearchMovieCubit>(context)
                        .fetchSearchMovie(movieName: value);
                  }),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search a Movie',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const Expanded(
                  child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: CustomSearchResult()))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchResult extends StatelessWidget {
  const CustomSearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMovieCubit, SearchMovieState>(
      builder: (context, state) {
        if (state is SearchMovieSuccess) {
          return RecommendedMoviesBody(
            movies: state.movies,
          );
        } else if (state is SearchMovieFailure) {
          return CustomErrorView(errMessage: state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
