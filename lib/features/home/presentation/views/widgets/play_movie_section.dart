import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/core/ulits/app_router.dart';
import 'package:movies_land/core/widgets/custom_error_view.dart';
import 'package:movies_land/features/home/data/models/movie/movie.trailer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../constats.dart';
import '../../../../../core/ulits/styles.dart';
import '../../../data/models/movie/movie.details.dart';
import '../../manager/movie_trailer_cubit/movie_trailer_cubit.dart';

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
  // CollectionReference movieId =
  //     FirebaseFirestore.instance.collection('favorite');
  final db = FirebaseFirestore.instance;

  bool isfavorite = false;
  @override
  void initState() {
    super.initState();
    checkIfUserLogedIn();
  }

  Future<void> checkIfUserLogedIn() async {
    if (kEmail != null) {
      var doc = await db.collection(kEmail!).doc(widget.movie.title).get();
      if (doc.exists) {
        isfavorite = true;
        // return true;
      } else {
        isfavorite = false;
        // return false;
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
              return const Center(
                child: CircularProgressIndicator(),
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
            onPressed: () {
              if (kEmail != null) {
                if (isfavorite) {
                  db
                      .collection(kEmail!)
                      .doc(widget.movie.title)
                      .delete()
                      .then((value) => print("movie Deleted"))
                      .catchError(
                          (error) => print("Failed to delete movie: $error"));

                  isfavorite = !isfavorite;
                } else {
                  final movie = db.collection(kEmail!);
                  final data = <String, dynamic>{
                    'movie_ID': widget.movie.id,
                    'movie_name': widget.movie.title
                  };
                  movie.doc(widget.movie.title).set(data);

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
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
          ),
        ),
      ],
    );
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
