import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  router.pushNamed('/test');
                },
                child: const Text('Test page')
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.clear();
                },
                child: const Text('Log out')
            )
          ],
        )
    );
  }
}
