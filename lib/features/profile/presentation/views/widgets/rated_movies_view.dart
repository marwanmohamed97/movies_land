import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/features/profile/presentation/views/widgets/rated_movies_view_body.dart';

import '../../../../../core/ulits/service_locator.dart';
import '../../../../home/data/repos/home_repo_impl.dart';
import '../../../../home/presentation/manager/movies_land_cubit/movies_land_cubit.dart';
import '../../../../home/presentation/views/widgets/custom_movie_item.dart';

class RatedMoviesView extends StatelessWidget {
  const RatedMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RatedMoviesViewBody();
  }
}
