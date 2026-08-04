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
      body: ArticleList()
    );
  }
}

class ArticleList extends StatefulWidget {

  const ArticleList({super.key});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  double totalPrice = 0;

  void updateTotalPrice(double itemPrice){
    setState(() {
      totalPrice += itemPrice;
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ArticleItem(name: "Clavier", price: 12.5, updatePrice: updateTotalPrice),
        ArticleItem(name: "Carte graphique", price: 32,  updatePrice: updateTotalPrice),
        ArticleItem(name: "Casque de réalité diminué", price: 12.33, updatePrice: updateTotalPrice),
        Text("Total commande = ${totalPrice}€")
      ],
    );
  }
}


class ArticleItem extends StatefulWidget {
  String name;
  double price;
  Function(double price) updatePrice;

  ArticleItem({super.key, required this.name, required this.price, required this.updatePrice});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  int quantity = 0;

  void _increment() {
    setState(() {
      quantity++;
      widget.updatePrice(widget.price);
    });
  }

  void _decrement() {
    setState(() {
      if (quantity >= 1){
        quantity--;
        widget.updatePrice(-widget.price);
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.name),
        IconButton(
          onPressed: _increment,
          icon: Icon(Icons.add_circle_outline_outlined),
        ),
        Text("$quantity"),
        IconButton(
          onPressed: _decrement,
          icon: Icon(Icons.remove_circle_outline),
        ),
        Text("Total = ${quantity * widget.price} €"),
      ],
    );
  }
}
