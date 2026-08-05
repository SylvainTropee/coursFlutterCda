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
    return const Scaffold(body: FormPage());
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Nom",
                hintText: "Veuillez saisir votre nom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                hintText: "Veuillez saisir votre age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              initialValue: "",
              decoration: InputDecoration(labelText: "Boisson Préférée"),
              items: [
                DropdownMenuItem(
                  value: "",
                  enabled: false,
                  child: Text("-Choisir sa boisson-"),
                ),
                DropdownMenuItem(value: "coffee", child: Text("Café")),
                DropdownMenuItem(value: "tea", child: Text("Thé")),
                DropdownMenuItem(value: "mint", child: Text("Vittel Menthe")),
              ],
              onChanged: (value) {},
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text("Accepter les conditions de votre rédition"),
              ],
            ),
            RadioGroup(
              onChanged: (value) {},
              child: Column(
                children: [
                  RadioListTile(value: "dog", title: Text("Chien")),
                  RadioListTile(value: "cat", title: Text("Chat")),
                ],
              ),
            ),
            ElevatedButton(onPressed: (){}, child: Text("Soumettre"))
          ],
        ),
      ),
    );
  }
}
