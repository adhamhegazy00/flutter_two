class ProductData {
  String name;
  String detail;
  String images ;
  int price;

  ProductData({
    required this.name,
    required this.detail,
    required this.price,
    required this.images,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      name: json['title'],
      detail: json['description'],
      price: json['price'],
      images: json['thumbnail'],
    );
  }
}