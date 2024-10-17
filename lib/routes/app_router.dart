import 'package:auto_route/auto_route.dart';

import '../pages/home_page.dart';
import '../pages/test_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      initial: true
    ),
    AutoRoute(
      page: TestRoute.page,
      path: '/test'
    )
  ];
}