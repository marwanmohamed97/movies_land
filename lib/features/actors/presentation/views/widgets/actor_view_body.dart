import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/features/home/data/models/actor_model.dart';
import '../../../../../core/ulits/app_router.dart';
import '../../../data/models/movie_by_actor_model.dart';
import 'movies_by_actor.dart';

class ActorViewBody extends StatelessWidget {
  const ActorViewBody({
    Key? key,
    required this.movies,
    required this.actor,
  }) : super(key: key);

  final List<MovieByActorModel> movies;
  final ActorModel actor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrlMaker(imageUrl: actor.profilePath),
              fit: BoxFit.fill,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black.withOpacity(.8),
                              Colors.black,
                              Colors.black,
                              Colors.black,
                              Colors.black,
                              Colors.black,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 36,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).pop();
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 400,
                            ),
                            Text(
                              actor.originalName ?? '',
                              style: Styles.textStyle34,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ),
                      MoviesByActor(
                        movies: movies,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
