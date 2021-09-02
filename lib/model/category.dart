

class Category {
  String name;
  String imageUrl;

  Category({this.name, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['image_url'];
  }
}
