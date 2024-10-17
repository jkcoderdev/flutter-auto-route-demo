import 'package:auto_route/auto_route.dart';
import 'package:auto_route_demo/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final loggedIn = preferences.getBool('logged_in') ?? false;

    if (!loggedIn) {
      router.push(LoginRoute(onSuccess: () {
        resolver.next(true);
        router.removeLast();
      }));
    } else {
      resolver.next(true);
    }
  }
}