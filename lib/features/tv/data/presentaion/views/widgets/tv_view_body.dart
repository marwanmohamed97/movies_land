import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/features/tv/data/presentaion/views/widgets/live_channels.dart';
import 'package:movies_land/features/tv/data/presentaion/views/widgets/tv_live_options.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../home/presentation/views/widgets/recommended_movies.dart';
import '../../../../../home/presentation/views/widgets/over_view_movie.dart';
import '../../../../../home/presentation/views/widgets/play_movie_section.dart';
import '../../../../../home/presentation/views/widgets/season_section.dart';

class TvViewBody extends StatefulWidget {
  const TvViewBody({Key? key}) : super(key: key);

  @override
  State<TvViewBody> createState() => _TvViewBodyState();
}

class _TvViewBodyState extends State<TvViewBody> {
  late YoutubePlayerController _controller;
  final Map<String, String> _channels = {
    'aljazera': 'bNyUyrR0PHo',
    'lofi': 'jfKfPfyJRdk',
    'BBC': 'bNyUyrR0PHo',
    'National Geographic': 'jfKfPfyJRdk',
    'NBC NEWS': 'bNyUyrR0PHo',
    'FOX': 'jfKfPfyJRdk',
    'Aljazera': 'bNyUyrR0PHo',
    'BBC NEWS': 'jfKfPfyJRdk',
    'aljazera4': 'bNyUyrR0PHo',
    'lofi4': 'jfKfPfyJRdk',
  };

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=${_channels.values.first}')!,
      flags: const YoutubePlayerFlags(
        isLive: true,
        autoPlay: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
          LiveChannels(channels: _channels, controller: _controller),
        ],
      ),
    );
  }
}
