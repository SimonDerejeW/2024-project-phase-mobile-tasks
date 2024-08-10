
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/product_repository.dart';

class DeleteProductUsecase {
  final ProductRepository productRepository;
  DeleteProductUsecase(this.productRepository);

  Future<Either<Failure,void>> execute(String productId){
    return productRepository.deleteProduct(productId);
  }
}