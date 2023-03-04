import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import 'package:movies_land/features/home/presentation/views/widgets/movie_details_view.dart';

import '../../../../../core/ulits/app_router.dart';

class CustomMovieItemView extends StatelessWidget {
  const CustomMovieItemView({
    super.key,
    required this.movies,
  });

  final List<MoviesLandModel> movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.movieDetailsView, extra: movies[index].id);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                    aspectRatio: 2.6 / 4,
                    child: CachedNetworkImage(
                      imageUrl:
                          imageUrlMaker(imageUrl: movies[index].posterPath!),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
