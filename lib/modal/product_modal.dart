class Product {
  final int id;
  final String name;
  final String description;
  final String img;
  final double price;
  final String priceTagline;
  final List<String> tags;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.img,
    required this.price,
    required this.priceTagline,
    required this.tags,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      img: json['img'],
      price: json['price'].toDouble(),
      priceTagline: json['price-tagline'],
      tags: List<String>.from(json['tags']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'img': img,
      'price': price,
      'price-tagline': priceTagline,
      'tags': tags,
    };
  }
}

class Grocery {
  final List<Product> english;
  final List<Product> hindi;
  final List<Product> gujarati;

  Grocery({
    required this.english,
    required this.hindi,
    required this.gujarati,
  });

  factory Grocery.fromJson(Map<String, dynamic> json) {
    return Grocery(
      english: (json['english'] as List)
          ?.map((item) => Product.fromJson(item))
          .toList()??[],
      hindi: (json['hindi'] as List)
          ?.map((item) => Product.fromJson(item))
          .toList()??[],
      gujarati: (json['gujarati'] as List)
          ?.map((item) => Product.fromJson(item))
          .toList()??[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'english': english.map((product) => product.toJson()).toList()??[],
      'hindi': hindi.map((product) => product.toJson()).toList()??[],
      'gujarati': gujarati.map((product) => product.toJson()).toList()??[],
    };
  }
}
