import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: "/page-1",
  routes: [
    GoRoute(path: "/page-1", builder: (context, state) => PageOne()),
    GoRoute(
      path: "/page-2/:id",
      builder: (context, state) {
        // int id = state.extra as int; //paramètre caché
        int id = int.parse(state.pathParameters['id']!);//paramètre obligatoire de l'url
        var message = state.uri.queryParameters['coucou']; // paramètre optionnel
        print(message);
        return PageTwo(articleId : id);
      },
    ),
  ],
);

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Page 1"),
          ElevatedButton(
            onPressed: () {
              context.push("/page-2/789", extra: 123);
            },
            child: Text("Go to page 2 !"),
          ),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  int articleId;
  PageTwo({super.key, required this.articleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Page 2 - $articleId"),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text("Back to the future !"),
          ),
        ],
      ),
    );
  }
}
