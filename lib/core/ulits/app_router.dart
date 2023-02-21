import 'package:go_router/go_router.dart';
import 'package:movies_land/features/auth/presentation/views/forget_password_view.dart';
import 'package:movies_land/features/auth/presentation/views/login_view.dart';
import 'package:movies_land/features/auth/presentation/views/signup_view.dart';
import 'package:movies_land/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const logInView = '/LogInView';
  static const signUpView = '/SignUpView';
  static const forgetPassword = '/forgetPassword';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
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
        path: forgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
    ],
  );
}
