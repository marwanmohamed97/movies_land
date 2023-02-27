import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/core/widgets/custom_error_view.dart';
import '../../manager/movies_land_cubit/movies_land_cubit.dart';
import 'custom_movie_item_view.dart';

class CustomMovieItem extends StatelessWidget {
  const CustomMovieItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesLandCubit, MoviesLandState>(
      builder: (context, state) {
        if (state is MoviesLandSuccess) {
          return CustomMovieItemView(
            movies: state.movies,
          );
        } else if (state is MoviesLandfailure) {
          return CustomErrorView(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

@override
void initState() {}
