import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/core/ulits/service_locator.dart';
import 'package:movies_land/features/actors/data/models/movie_by_actor_model.dart';
import 'package:movies_land/features/actors/presentation/manager/cubit/movie_by_actor_cubit.dart';
import 'package:movies_land/features/actors/presentation/views/actor_view.dart';
import 'package:movies_land/features/auth/presentation/views/forget_password_view.dart';
import 'package:movies_land/features/auth/presentation/views/login_view.dart';
import 'package:movies_land/features/auth/presentation/views/signup_view.dart';
import 'package:movies_land/features/home/data/models/actor_model.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_land/features/home/presentation/views/home_view.dart';
import 'package:movies_land/features/home/presentation/views/widgets/movie_details_view.dart';
import 'package:movies_land/features/profile/presentation/manager/search_movie_cubit/search_movie_cubit.dart';
import 'package:movies_land/features/profile/presentation/views/widgets/favorites_view.dart';
import 'package:movies_land/features/search/presentation/views/search_view.dart';
import 'package:movies_land/features/splash/presentation/views/splash_view.dart';

import '../../features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';

abstract class AppRouter {
  static const logInView = '/LogInView';
  static const signUpView = '/SignUpView';
  static const forgetPasswordView = '/forgetPassword';
  static const searchView = '/SearchView';
  static const movieDetailsView = '/MovieDetailsView';
  static const actorView = '/ActorView';
  static const homeView = '/HomeView';
  static const faviritesView = '/FavoritesView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: logInView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchMovieCubit(getIt.get<HomeRepoImpl>()),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: movieDetailsView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => MoviesDetailsCubit(getIt.get<HomeRepoImpl>()),
            child: MovieDetailsView(movie: state.extra as int),
          );
        },
      ),
      GoRoute(
        path: actorView,
        builder: (context, state) => BlocProvider(
          create: (context) => MovieByActorCubit(getIt.get<HomeRepoImpl>()),
          child: ActorView(movie: state.extra as ActorModel),
        ),
      ),
      GoRoute(
        path: faviritesView,
        builder: (context, state) => BlocProvider(
          create: (context) => MoviesDetailsCubit(getIt.get<HomeRepoImpl>()),
          child: const FavoriteView(),
        ),
      ),
    ],
  );
}
