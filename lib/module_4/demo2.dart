import 'package:flutter/material.dart';

void main() {
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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              print("coucou");
            },
            child: const Text("Click ici !"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [Icon(Icons.photo_camera), Text("Prendre une photo")],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber)),
            label: Text("Prendre une photo"),
            icon: Icon(Icons.photo_camera),
          ),
          Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/a/a0/Grogu_%28Star_Wars%29.jpg/250px-Grogu_%28Star_Wars%29.jpg"),
          Image.asset("flutter.png")
        ],
      ),
    );
  }
}
