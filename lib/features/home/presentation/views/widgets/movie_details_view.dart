import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/core/ulits/service_locator.dart';
import 'package:movies_land/core/widgets/custom_error_view.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_land/features/home/presentation/views/manager/movie_trailer_cubit/movie_trailer_cubit.dart';
import 'package:movies_land/features/home/presentation/views/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_land/features/home/presentation/views/widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MoviesLandModel movie;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    BlocProvider.of<MoviesDetailsCubit>(context).fetchMovieDetails(
      movieId: widget.movie.id!,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
      builder: (context, state) {
        if (state is MoviesDetailsSuccess) {
          return BlocProvider(
            create: (context) => MovieTrailerCubit(getIt.get<HomeRepoImpl>())
              ..fetchMovieTrailer(movieId: widget.movie.id!),
            child: MovieDetailsViewBody(
              movie: state.movie[0],
            ),
          );
        } else if (state is MoviesDetailsFailure) {
          return CustomErrorView(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
