import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class CreateProductUsecase {
  final ProductRepository productRepository;
  CreateProductUsecase(this.productRepository);

  Future<Either<Failure, Product>> execute(Product product) {
    return productRepository.createProduct(product);
  }
}
