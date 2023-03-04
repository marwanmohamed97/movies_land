import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constats.dart';
import '../../../../../core/ulits/app_router.dart';
import '../../../../../core/ulits/styles.dart';
import '../../../data/models/movie_by_actor_model.dart';

class MoviesByActor extends StatelessWidget {
  const MoviesByActor({Key? key, required this.movies}) : super(key: key);
  final List<MovieByActorModel> movies;
  @override
  Widget build(BuildContext context) {
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
            width: double.infinity,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: 2.6 / 3,
                      child: Image.network(
                        imageUrlMaker(imageUrl: movies[index].posterPath),
                        fit: BoxFit.fill,
                      ),
                    ),
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
                          maxLines: 3,
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
        );
      },
    );
  }
}
