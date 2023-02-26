import 'package:flutter/material.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';

import '../../../../../core/ulits/styles.dart';

class OverViewMovie extends StatelessWidget {
  const OverViewMovie({
    super.key,
    required this.movies,
  });

  final MovieDetailModel movies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movies.title ?? '',
          style: Styles.textStyle34.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              Image.asset('assets/images/tomato.png'),
              const SizedBox(
                width: 8,
              ),
              Text(
                movies.voteAverage?.toStringAsFixed(1) ?? '',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 50,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Center(child: Text(' - ')),
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.genres?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        '${movies.genres?[index].name}' ?? '',
                        style: Styles.textStyle14
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          movies.overview ?? '',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
