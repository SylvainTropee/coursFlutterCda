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
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DrinkList(),
    );
  }
}

class DrinkList extends StatelessWidget {
  List<String> drinks = [
    "Mojito",
    "Bière Single malt",
    "Vittel menthe",
    "Vin",
    "Mojito",
    "Bière Single malt",
    "Vittel menthe",
    "Vin",
    "Mojito",
    "Bière Single malt",
    "Vittel menthe",
    "Vin"

  ];

  DrinkList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: drinks.length,
          itemBuilder: (context, index){
            return Container(
              child: Text(drinks[index]),
              color: Colors.blue,
              height: 100,
            );
          }
      ),
    );
  }
}




class BigPage extends StatelessWidget {
  const BigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: [
                Text("Debut de la colonne"),
                SizedBox(height: 2500),
                Text("Fin de la colonne"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Hello World !"),
              Text("Hello World 2 !"),
            ],
          ),
        ],
      ),
    );
  }
}



