# Flutter Auto Route Demo

A simple Flutter application representing the use of auto_route package.

## Documentation
https://pub.dev/packages/auto_route

## Creating a router

### Step 0
Make sure you added auto_route to dependencies and auto_route_generator to dev_dependencies in pubspec.yaml file.
Also every page should be declared as @RoutePage. Example:
```dart
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Center(
          child: const Text('Hello World!')
        )
    );
  }
}
```

### Step 1
Create routes folder

### Step 2
Create new file inside called app_router.dart
```dart
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      initial: true
    ),
    AutoRoute(
        page: TestRoute.page,
        path: '/test',
    ),
    // ...
  ];
}
```

### Step 3
Run the following command
```shell
dart run build_runner build
```

### Step 4
Add router to the material app
```dart
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
```

## Using a router

Anytime you want to use your router you need get it from context. There are 2 ways to do that:
1. AutoRouter.of(context)
2. context.router

### Go to specified page

```dart
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get router from context
    final router = AutoRouter.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  // HERE
                  router.pushNamed('/test');
                },
                child: const Text('Test page')
            )
          ],
        )
    );
  }
}
```

### Go back to previous page

```dart
@RoutePage()
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get router from context
    final router = AutoRouter.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test page'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // HERE
              router.back();
            },
            child: const Text('Return to home page')
          )
        ],
      )
    );
  }
}
```