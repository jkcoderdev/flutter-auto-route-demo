import 'package:flutter/material.dart';

import 'package:auto_route_demo/routes/app_router.dart';
// import 'package:auto_route_demo/pages/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}