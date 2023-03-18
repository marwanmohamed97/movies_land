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
    'aljazera1': 'bNyUyrR0PHo',
    'lofi1': 'jfKfPfyJRdk',
    'aljazera2': 'bNyUyrR0PHo',
    'lofi2': 'jfKfPfyJRdk',
    'aljazera3': 'bNyUyrR0PHo',
    'lofi3': 'jfKfPfyJRdk',
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
        autoPlay: false,
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
          Channels(channels: _channels, controller: _controller),
          //LIve
        ],
      ),
    );
  }
}

class Channels extends StatefulWidget {
  const Channels({
    super.key,
    required Map<String, String> channels,
    required YoutubePlayerController controller,
  })  : _channels = channels,
        _controller = controller;

  final Map<String, String> _channels;
  final YoutubePlayerController _controller;

  @override
  State<Channels> createState() => _ChannelsState();
}

final Map<String, String> imageList = {
  'aljazera':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDegRMNo_Y_yjLRZkj6DmRq7uQARGaHuZbLw',
  'LOFI': 'https://i1.sndcdn.com/artworks-27T65S5r0IZq3TtN-An0LOQ-t500x500.jpg',
  'BBC':
      'https://yt3.googleusercontent.com/MRywaef1JLriHf-MUivy7-WAoVAL4sB7VHZXgmprXtmpOlN73I4wBhjjWdkZNFyJNiUP6MHm1w=s900-c-k-c0x00ffffff-no-rj',
  'National geographic':
      'https://yt3.googleusercontent.com/ytc/AL5GRJV5koTcK1Zq-F-3BCjM5OKQa8PKF4dQ9wy8g3uVtg=s900-c-k-c0x00ffffff-no-rj',
  'NBC NEWS': 'https://variety.com/wp-content/uploads/2019/07/nbc-news.png',
  'FOX': 'https://tejedd76pluu.merlincdn.net/img/FOXLogo.jpg',
  'aljazera3':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDegRMNo_Y_yjLRZkj6DmRq7uQARGaHuZbLw',
  'BBC NEWS':
      'https://yt3.googleusercontent.com/MRywaef1JLriHf-MUivy7-WAoVAL4sB7VHZXgmprXtmpOlN73I4wBhjjWdkZNFyJNiUP6MHm1w=s900-c-k-c0x00ffffff-no-rj',
  'National geographic WILD':
      'https://yt3.googleusercontent.com/ytc/AL5GRJV5koTcK1Zq-F-3BCjM5OKQa8PKF4dQ9wy8g3uVtg=s900-c-k-c0x00ffffff-no-rj',
  'lofi4':
      'https://i1.sndcdn.com/artworks-27T65S5r0IZq3TtN-An0LOQ-t500x500.jpg',
};
int selectedIndex = 0;

class _ChannelsState extends State<Channels> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget._channels.length,
        itemBuilder: (context, index) {
          final String key = widget._channels.keys.elementAt(index);
          final String value = widget._channels.values.elementAt(index);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget._controller.load(value);
                widget._controller.play();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                  color: selectedIndex == index ? kPrimaryColor : Colors.black,
                ),
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageList.values.elementAt(index),
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      key,
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
