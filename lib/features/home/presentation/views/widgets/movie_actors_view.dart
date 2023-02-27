import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constats.dart';
import '../../../../../core/ulits/app_router.dart';
import '../../../../../core/ulits/styles.dart';
import '../../../data/models/actor_model.dart';

class MovieActorsView extends StatelessWidget {
  const MovieActorsView({Key? key, required this.actor}) : super(key: key);

  final List<ActorModel> actor;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: actor.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.actorView,
              extra: actor[index],
            );
          },
          child: Container(
            color: Colors.black,
            width: double.infinity,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: 2.6 / 3,
                      child: Image.network(
                        imageUrlMaker(imageUrl: actor[index].profilePath ?? ''),
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
                          actor[index].name ?? ' None',
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
