class Product {
   final  int id;
   final  String title;
   final  String category;
   final  num price;
   final  String image;
   final  String details;
  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.image,
    required this.details,
  });

 factory Product.fromJson(Map<String, dynamic> json) {
return Product(
    id : json['id'],
    title : json['title'],
    category : json['category'],
    price : json['price'],
    image : json['image'],
    details : json['details'],
);
  }
}
