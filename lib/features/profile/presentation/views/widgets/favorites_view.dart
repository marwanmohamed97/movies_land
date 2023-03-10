import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/service_locator.dart';
import 'package:movies_land/core/widgets/custom_error_view.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_land/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_land/features/home/presentation/manager/movies_land_cubit/movies_land_cubit.dart';
import 'package:movies_land/features/profile/data/models/favorite_movies.dart';
import 'package:movies_land/features/profile/presentation/views/widgets/favorites_view_body.dart';

import '../../../../../core/ulits/app_router.dart';
import '../../../../../core/ulits/styles.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  // CollectionReference movies = FirebaseFirestore.instance.collection(kEmail!);
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection(kEmail!);
  final ref = FirebaseFirestore.instance.collection(kEmail!).snapshots();
  // Future getData() async {

  //   QuerySnapshot querySnapshot = await _collectionRef.get();

  //   final allData = querySnapshot.docs.map((doc) => doc.data());
  //   List<FavoriteMoviesModel> movies = [];

  //   for (var item in allData.cast<Map<String, dynamic>>()) {
  //     movies.add(FavoriteMoviesModel.fromJson(item));
  //   }
  //   return movies;
  // }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder<QuerySnapshot>(
        stream: ref,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final documents = snapshot.data!.docs;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final document = documents[index];
              final data = document.data() as Map<String, dynamic>;
              return BlocProvider(
                create: (context) =>
                    MoviesDetailsCubit(getIt.get<HomeRepoImpl>())
                      ..fetchMovieDetails(movieId: data['movie_ID']),
                child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
                  builder: (context, state) {
                    if (state is MoviesDetailsSuccess) {
                      return FavoriteMoviesItem(
                        movies: state.movie,
                      );
                    } else if (state is MoviesDetailsFailure) {
                      return CustomErrorView(errMessage: state.errMessage);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FavoriteMoviesItem extends StatelessWidget {
  const FavoriteMoviesItem({Key? key, required this.movies}) : super(key: key);

  final List movies;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.movieDetailsView, extra: movies[0].id);
      },
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                        imageUrl: imageUrlMaker(imageUrl: movies[0].posterPath),
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
                        movies[0].title ?? '',
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
                        movies[0].overview ?? '',
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
  }
}
