class Cat {
  String id;
  String imageUrl;

  Cat({required this.id, required this.imageUrl});

  Cat.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      imageUrl = json['url'];
}
