import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomMovieItemLoading extends StatelessWidget {
  const CustomMovieItemLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 49, 49, 49)!,
              highlightColor: Color.fromARGB(255, 5, 5, 5)!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: Container(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
