import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import 'package:movies_land/features/home/presentation/views/widgets/recommended_movies.dart';
import 'package:movies_land/features/profile/presentation/views/widgets/favorites_view_body.dart';

import '../../../../../constats.dart';
import '../../../../../core/ulits/app_router.dart';
import '../../../../../core/ulits/service_locator.dart';
import '../../../../../core/ulits/styles.dart';
import '../../../../../core/widgets/custom_error_view.dart';
import '../../../../../core/widgets/custom_list_of_movies_loading.dart';
import '../../../../../core/widgets/custom_movie_item_loading.dart';
import '../../../../home/data/repos/home_repo_impl.dart';
import '../../../../home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import '../../../../home/presentation/manager/movies_land_cubit/movies_land_cubit.dart';
import '../../../../home/presentation/views/widgets/custom_movie_item_view.dart';

class RatedMoviesViewBody extends StatefulWidget {
  const RatedMoviesViewBody({Key? key}) : super(key: key);

  @override
  State<RatedMoviesViewBody> createState() => _RatedMoviesViewBodyState();
}

class _RatedMoviesViewBodyState extends State<RatedMoviesViewBody> {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection(kEmail!);

  final ref = FirebaseFirestore.instance.collection(kEmail!).snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Favorites'),
      ),
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (context) => MoviesDetailsCubit(getIt.get<HomeRepoImpl>())
          ..fetchRatedMovies(ratedMovies: kSessionID!),
        child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
          builder: (context, state) {
            if (state is MoviesDetailsSuccess) {
              return RatedMovies(
                movies: state.movie,
              );
            } else if (state is MoviesDetailsFailure) {
              return CustomErrorView(errMessage: state.errMessage);
            } else {
              return const CustomListOfMoviesLoading();
            }
          },
        ),
      ),
    );
  }
}

class RatedMovies extends StatelessWidget {
  const RatedMovies({Key? key, required this.movies}) : super(key: key);

  final List movies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.movieDetailsView, extra: movies[index].id);
              },
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: AspectRatio(
                              aspectRatio: 2.6 / 3,
                              child: CachedNetworkImage(
                                imageUrl: imageUrlMaker(
                                    imageUrl: movies[index].posterPath),
                                fit: BoxFit.fill,
                              )),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movies[index].title ?? '',
                                style: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 2,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                movies[index].overview ?? '',
                                style: Styles.textStyle14.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(.87)),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 4,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Download and watch offline',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
