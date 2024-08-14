part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class LoadAllProductEvent extends ProductEvent {
  final List<Product> products;

  LoadAllProductEvent(this.products);
}