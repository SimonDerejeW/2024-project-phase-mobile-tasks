import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetCurrentProductUsecase {
  final ProductRepository productRepository;

  GetCurrentProductUsecase(this.productRepository);

  Future<Either<Failure, Product>> execute(String productId) async {
    return await productRepository.getCurrentProduct(productId);
  }
}
