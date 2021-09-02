class Venue {
  Venue({
    this.address,
    this.adminId,
    this.capacity,
    this.category,
    this.categoryId,
    this.contact,
    this.cost,
    this.description,
    this.gps,
    this.id,
    this.images,
    this.imageUrls,
    this.name,
    this.ownerName,
    this.ownerMobile,
    this.distance,
  });

  String address;
  int adminId;
  String capacity;
  String category;
  int categoryId;
  String contact;
  int cost;
  String description;
  String gps;
  int id;
  List<String> images;
  List<String> imageUrls;
  String name;
  String ownerName;
  String ownerMobile;
  dynamic distance;

  Venue.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    adminId = json['admin_id'];
    capacity = json['capacity'];
    category = json['category'];
    categoryId = json['category_id'];
    contact = json['contact'];
    cost = json['cost'];
    description = json['description'];
    gps = json['gps'];
    id = json['id'];
    images = json['images'].cast<String>();
    imageUrls = json['image_urls'].cast<String>();
    name = json['name'];
    ownerName = json['owner_name'];
    ownerMobile = json['owner_mobile'];
    distance = json['distance'];
  }
}
