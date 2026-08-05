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
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? name, age, drink, animal;
  bool isChecked = false;

  TextEditingController nameController = TextEditingController();

  String? validateAge(String? value){
    if (value == null || value.isEmpty) {
      return "Le champ est obligatoire";
    }
    if (int.parse(value) < 18) {
      return "Interdit au mineur !";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              // initialValue: "coucou",
              onSaved: (value){
                name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Le champ est obligatoire";
                }
                if (value.length < 3) {
                  return "Minimum 3 caractères !";
                }
                return null;
              },
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
              onSaved: (value){
                age = value;
              },
              validator: validateAge,
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
            DropdownButtonFormField<String>(
              onSaved: (value){
                drink = value;
              },
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
              onChanged: (value) {
                if(value == "mint"){
                  nameController.text = "C'est bon la menthe !";
                }
              },
            ),
            Row(
              children: [
                Checkbox(value: isChecked, onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
                Text("Accepter les conditions de votre rédition"),
              ],
            ),
            RadioGroup<String>(
              groupValue: animal,
              onChanged: (value) {
                setState(() {
                  animal = value;
                });
              },
              child: Column(
                children: [
                  RadioListTile(value: "dog", title: Text("Chien")),
                  RadioListTile(value: "cat", title: Text("Chat")),
                ],
              ),
            ),
            ElevatedButton(onPressed: () {
              if(_key.currentState!.validate()){
                print("$name - $age - $drink - $animal - $isChecked");
                _key.currentState!.save();
                print("$name - $age - $drink - $animal - $isChecked");
              }
            }, child: Text("Soumettre")),
          ],
        ),
      ),
    );
  }
}
