import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

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
            )
          ],
        )
    );
  }
}
