
import '../../../../core/error/failure.dart';
import '../../domain/entities/product.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  @override
  Future<Either<Failure, Product>> createProduct(Product product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> getCurrentProduct(String id) {
    // TODO: implement getCurrentProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}