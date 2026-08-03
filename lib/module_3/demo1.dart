//variables
// void main(){
//   print("Hello World");
//
//   String hello = "Bonjour Michel";
//   print(hello);
//
//   //inférrence de type
//   var name = "Michel";
//   name = "Bernard";
//   // name = 18; // Pas possible
//
//   //type tout
//   dynamic truc = 12;
//   truc = "Coucou";
//
//   //constante
//   const age = 22;
//   // age = 44; // Pas possible
//
//   //gestion du null
//   String? city = null;
//   // city = "Quimper";
//
//   print(city?.toUpperCase() ?? "Rennes");
//   // print(city!.toUpperCase());
// }

//fonctions et paramètres
void main() {

  // displayMessage("Coucou", 12);
  displayMessage2(number: 3, message: "Hello");
  displayMessage2(message: "Salut");
}

void displayMessage(String message, int number) {
  for (int i = 0; i < number; i++) {
    print(message);
  }
}
void displayMessage2({required String message, int number = 1}) {
  for (int i = 0; i < number; i++) {
    print(message);
  }
}
