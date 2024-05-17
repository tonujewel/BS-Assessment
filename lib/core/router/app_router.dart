import 'package:bs_assessment/features/home/domain/entities/repository_entity.dart';
import 'package:bs_assessment/features/splash/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/details/presentation/pages/details_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../utils/app_constant.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: AppConstant.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppConstant.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: AppConstant.details,
        builder: (context, state) {
          final product = state.extra as RepositoryEntity;
          return DetailsScreen(data: product);
        }),
  ],
);
