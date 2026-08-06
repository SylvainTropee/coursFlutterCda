import 'package:flutter/material.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: "/page-1",
      routes: {
        "/page-1": (context) => PageOne(),
        "/page-2": (context) => PageTwo(),
      },
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Page 1"),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, "/page-2");
          }, child: Text("Go to page 2 !")),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Page 2"),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Back to the future !")),
        ],
      ),
    );
  }
}
