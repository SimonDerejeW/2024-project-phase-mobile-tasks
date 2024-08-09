import 'package:collection/collection.dart';

class Shoe {
  final String image;
  final String name;
  final double price;
  final String type;
  final double rating;
  final List<int> size;
  final String description;
  const Shoe(
      {required this.image,
      required this.name,
      required this.price,
      required this.type,
      required this.rating,
      required this.size,
      required this.description});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Shoe &&
        other.image == image &&
        other.name == name &&
        other.price == price &&
        other.type == type &&
        other.rating == rating &&
        const ListEquality().equals(other.size, size) &&
        other.description == description;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        name.hashCode ^
        price.hashCode ^
        type.hashCode ^
        rating.hashCode ^
        size.hashCode ^
        description.hashCode;
  }
}
