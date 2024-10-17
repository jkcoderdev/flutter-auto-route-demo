import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test page'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              router.back();
            },
            child: const Text('Return to home page')
          )
        ],
      )
    );
  }
}
