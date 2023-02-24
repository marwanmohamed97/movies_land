import 'package:go_router/go_router.dart';
import 'package:movies_land/features/auth/presentation/views/forget_password_view.dart';
import 'package:movies_land/features/auth/presentation/views/login_view.dart';
import 'package:movies_land/features/auth/presentation/views/signup_view.dart';
import 'package:movies_land/features/home/presentation/views/home_view.dart';
import 'package:movies_land/features/home/presentation/views/widgets/movie_details_view.dart';
import 'package:movies_land/features/search/presentation/views/search_view.dart';
import 'package:movies_land/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const logInView = '/LogInView';
  static const signUpView = '/SignUpView';
  static const forgetPasswordView = '/forgetPassword';
  static const searchView = '/SearchView';
  static const movieDetailsView = '/MovieDetailsView';
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
        path: signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: movieDetailsView,
        builder: (context, state) => const MovieDetailsView(),
      ),
    ],
  );
}
