import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../constats.dart';
import '../../../../../../core/ulits/styles.dart';

class LiveChannels extends StatefulWidget {
  const LiveChannels({
    super.key,
    required Map<String, String> channels,
    required YoutubePlayerController controller,
  })  : _channels = channels,
        _controller = controller;

  final Map<String, String> _channels;
  final YoutubePlayerController _controller;

  @override
  State<LiveChannels> createState() => _LiveChannelsState();
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

class _LiveChannelsState extends State<LiveChannels> {
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
                      style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == index ? Colors.black : null),
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
