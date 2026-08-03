//POO
class Pastry {
  String name;
  double price;
  bool isHot;

  Pastry({required this.name, required this.price, this.isHot = false});

  Pastry.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      price = json['price'],
      isHot = json['isHot'];

  @override
  String toString() {
    return 'Pastry{name: $name, price: $price, isHot: $isHot}';
  }
}

void main() {
  // Pastry pao = Pastry("Pain au chocolat", 1.20, false);
  Pastry pao = Pastry(name: "Pain au chocolat", price: 1.20);
  print(pao);

  var json = {
    "name" : "Pain aux raisins",
    "price" : 1.50,
    "isHot" : false
  };

  Pastry par = Pastry.fromJson(json);
  print(par);

}
