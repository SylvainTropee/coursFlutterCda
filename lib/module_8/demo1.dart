import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cat.dart';

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
    return const Scaffold(body: CatView());
  }
}

class CatView extends StatefulWidget {
  const CatView({super.key});

  @override
  State<CatView> createState() => _CatViewState();
}

class _CatViewState extends State<CatView> {
  Cat? cat;

  Future<Cat?> getCat() async {
    var response = await http.get(
      Uri.parse("https://api.thecatapi.com/v1/images/search"),
    );
    if (response.statusCode == 200) {
      var body = response.body;
      var data = jsonDecode(body)[0];
      //setState(() {
      cat = Cat.fromJson(data);
      // });
    }
    return cat;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCat();
  }

  @override
  Widget build(BuildContext context) {
    if (cat != null) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Text(cat!.id),
            Image.network(
              cat!.imageUrl,
              webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
            ),
            FutureBuilder(
              future: getCat(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var cat2 = snapshot.data;
                  return Column(
                    children: [
                      Text(cat2!.id),
                      Image.network(
                        cat2!.imageUrl,
                        webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                      ),
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      );
    }
    return CircularProgressIndicator();
  }
}
