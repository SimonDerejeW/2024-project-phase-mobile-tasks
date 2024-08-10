import '../../../../core/error/exception.dart';
import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required double price,
  }) : super(
            id: id,
            name: name,
            description: description,
            imageUrl: imageUrl,
            price: price);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        price: (json['price'] as num).toDouble(),
      );
    } catch (e) {
      throw JsonParsingException('Failed to cast json to product model: $e');
    }
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}
