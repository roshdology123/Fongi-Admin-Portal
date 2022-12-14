class Product {
  String? sId;
  String? title;
  String? description;
  int? price;
  String? size;
  String? color;
  String? image;
  String? category;
  String? date;

  Product(
      {this.sId,
        this.title,
        this.description,
        this.price,
        this.size,
        this.color,
        this.image,
        this.category,
        this.date,
      });

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    size = json['size'];
    color = json['color'];
    image = json['image'];
    category = json['category'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['size'] = size;
    data['color'] = color;
    data['image'] = image;
    data['category'] = category;
    data['date'] = date;
    return data;
  }
}