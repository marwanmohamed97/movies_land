import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/core/widgets/custom_error_view.dart';
import 'package:movies_land/features/home/data/models/movie/movie.trailer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../constats.dart';
import '../../../../../core/ulits/styles.dart';
import '../../manager/movie_trailer_cubit/movie_trailer_cubit.dart';

class PlayMovieSection extends StatelessWidget {
  const PlayMovieSection({
    super.key,
    //required this.movie,
  });
  //final MovieTrailerModel movie;

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
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
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
