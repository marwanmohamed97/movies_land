import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/core/ulits/app_router.dart';
import 'package:movies_land/core/widgets/custom_error_view.dart';
import 'package:movies_land/features/home/data/models/movie/movie.trailer.dart';
import 'package:movies_land/features/home/presentation/manager/rated_movies_cubit/rated_movies_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../constats.dart';
import '../../../../../core/ulits/service_locator.dart';
import '../../../../../core/ulits/styles.dart';
import '../../../data/models/movie/movie.details.dart';
import '../../../data/repos/home_repo_impl.dart';
import '../../manager/movie_trailer_cubit/movie_trailer_cubit.dart';
import 'package:http/http.dart' as http;

import '../../manager/movies_details_cubit/movies_details_cubit.dart';

class PlayMovieSection extends StatefulWidget {
  const PlayMovieSection({
    super.key,
    required this.movie,
  });

  final MovieDetailModel movie;
  @override
  State<PlayMovieSection> createState() => _PlayMovieSectionState();
}

class _PlayMovieSectionState extends State<PlayMovieSection> {
  final db = FirebaseFirestore.instance;

  bool isfavorite = false;
  @override
  void initState() {
    super.initState();
    getFavorate();
    checkIfUserLogedIn();
  }

  String? favorate;
  getFavorate() async {
    print('get favorate run');
    final db = FirebaseFirestore.instance;
    db.collection(kEmail!).doc(widget.movie.title).get().then((value) {
      final data = value.data() as Map<String, dynamic>;
      setState(() {
        favorate = data['movie_name'];
      });
      print(favorate);
    });
  }

  Future<void> checkIfUserLogedIn() async {
    if (kEmail != null) {
      var doc = await db.collection(kEmail!).doc(widget.movie.title).get();
      if (doc.exists) {
        isfavorite = true;
      } else {
        isfavorite = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<MovieTrailerCubit, MovieTrailerState>(
          builder: (context, state) {
            if (state is MovieTrailerSuccess) {
              return CustomPlayTrailerButton(
                movie: state.movie[0],
              );
            } else if (state is MovieTrailerFailure) {
              return CustomErrorView(errMessage: state.errMessage);
            } else {
              return SizedBox(
                width: 115,
                height: 61,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'PLAY',
                        style: Styles.textStyle14.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
        const SizedBox(
          width: 20,
        ),
        FutureBuilder(
          future: checkIfUserLogedIn(),
          builder: (context, snapshot) => IconButton(
            onPressed: () async {
              if (kEmail != null) {
                if (isfavorite) {
                  db.collection(kEmail!).doc(widget.movie.title).delete();
                  getFavorate();
                  checkIfUserLogedIn();
                  isfavorite = !isfavorite;
                } else {
                  db.collection(kEmail!).doc(widget.movie.title).set({
                    'movie_ID': widget.movie.id,
                    'movie_name': widget.movie.title,
                  });
                  getFavorate();
                  checkIfUserLogedIn();
                  isfavorite = !isfavorite;
                }
                setState(() {});
              } else {
                GoRouter.of(context).push(AppRouter.logInView);
              }
            },
            icon: Icon(
              isfavorite ? Icons.favorite : Icons.favorite_border,
              color: isfavorite ? Colors.red : Colors.white,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            rateMoviesDialog(context);
          },
          child: const Text(
            'Rate',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Future<dynamic> rateMoviesDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        double rating = 0;
        return BlocProvider(
          create: (context) => RatedMoviesCubit(getIt.get<HomeRepoImpl>())
            ..fetchRatedMovies(
                ratedMovies: kSessionID!, movieID: widget.movie.id!),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
              width: MediaQuery.of(context).size.width - 60,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<RatedMoviesCubit, RatedMoviesState>(
                    builder: (context, state) {
                      if (state is RatedMoviesSuccess) {
                        double? ratedMovie;
                        ratedMovie = state.movieRate;

                        return RatingBar(
                          initialRating:
                              ratedMovie != null ? ratedMovie / 2 : 0,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.orange,
                            ),
                            empty: const Icon(Icons.star_border),
                          ),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          onRatingUpdate: (rate) {
                            setState(() {
                              rating = rate * 2;
                            });
                          },
                        );
                      } else if (state is RatedMoviesFaliure) {
                        return CustomErrorView(errMessage: state.errMessage);
                      } else {
                        return RatingBar(
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.orange,
                            ),
                            empty: const Icon(Icons.star_border),
                          ),
                          onRatingUpdate: (value) {},
                        );
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          deleteRatedMovie(context);
                        },
                        child: Text(
                          'Delete Rate',
                          style:
                              Styles.textStyle14.copyWith(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                        ),
                        onPressed: () {
                          addRatedMovieToFirebase(context, rating);
                        },
                        child: Text(
                          'Rate Movie',
                          style:
                              Styles.textStyle14.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void addRatedMovieToFirebase(BuildContext context, double rating) {
    if (kSessionID == null) {
      GoRouter.of(context).push(AppRouter.logInView);
    } else {
      rateMovie(
          movieId: widget.movie.id!, rating: rating, sessionId: kSessionID!);
    }
    final user = FirebaseFirestore.instance.collection('Ratings');
    FirebaseFirestore.instance
        .collection('Ratings')
        .doc(kEmail)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        user.doc(kEmail).update({
          widget.movie.title!: {
            'Movie_name': widget.movie.title,
            'Movie_ID': widget.movie.id,
            'Rate': rating
          }
        });
      } else {
        user.doc(kEmail).set({
          widget.movie.title!: {
            'Movie_name': widget.movie.title,
            'Movie_ID': widget.movie.id,
            'Rate': rating
          }
        });
      }
    });

    Navigator.of(context).pop();
  }

  void deleteRatedMovie(BuildContext context) {
    if (kSessionID == null) {
      GoRouter.of(context).push(AppRouter.logInView);
    } else {
      deleteMovie(movieId: widget.movie.id!, sessionId: kSessionID!);
    }
    final user = FirebaseFirestore.instance.collection('Ratings');
    FirebaseFirestore.instance
        .collection('Ratings')
        .doc(kEmail)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        user.doc(kEmail).update({widget.movie.title!: FieldValue.delete()});
      }
    });
    Navigator.of(context).pop();
  }

  Future<Map<String, dynamic>> rateMovie(
      {required int movieId,
      required double rating,
      required String sessionId}) async {
    final response = await http.post(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/rating?api_key=319b1920e86cdd05a805f90bbf1e21b7&guest_session_id=$sessionId'),
      body: jsonEncode({
        'value': rating,
      }),
      headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Authorization': 'Bearer 319b1920e86cdd05a805f90bbf1e21b7',
      },
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to rate movie. ${response.body}');
    }
  }

  Future<Map<String, dynamic>> deleteMovie(
      {required int movieId, required String sessionId}) async {
    final response = await http.delete(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/rating?api_key=319b1920e86cdd05a805f90bbf1e21b7&guest_session_id=$sessionId'),
      headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Authorization': 'Bearer 319b1920e86cdd05a805f90bbf1e21b7',
      },
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to rate movie. ${response.body}');
    }
  }
}

class CustomPlayTrailerButton extends StatefulWidget {
  const CustomPlayTrailerButton({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieTrailerModel movie;

  @override
  State<CustomPlayTrailerButton> createState() =>
      _CustomPlayTrailerButtonState();
}

class _CustomPlayTrailerButtonState extends State<CustomPlayTrailerButton> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=${widget.movie.results![0].key}')!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        disableDragSeek: true,
        loop: true,
        enableCaption: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 61,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        onPressed: () {
          playMovieTrailer(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.play_arrow,
              color: Colors.black,
              size: 32,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'PLAY',
              style: Styles.textStyle14
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }

  void playMovieTrailer(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 50,
                    blurRadius: 60,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: YoutubePlayer(
                controller: _controller!,
                showVideoProgressIndicator: true,
                bottomActions: <Widget>[
                  const SizedBox(width: 14.0),
                  CurrentPosition(),
                  const SizedBox(width: 8.0),
                  ProgressBar(isExpanded: true),
                  RemainingDuration(),
                ],
                aspectRatio: 4 / 3,
                progressIndicatorColor: Colors.white,
              ),
            ),
          );
        });
  }
}
