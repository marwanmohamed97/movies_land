import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/service_locator.dart';
import 'package:movies_land/core/widgets/custom_error_view.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_land/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_land/features/home/presentation/manager/movies_land_cubit/movies_land_cubit.dart';
import 'package:movies_land/features/profile/data/models/favorite_movies.dart';
import 'package:movies_land/features/profile/presentation/views/widgets/favorites_view_body.dart';

import '../../../../../core/ulits/app_router.dart';
import '../../../../../core/ulits/styles.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FavoritesViewBody();
  }
}
