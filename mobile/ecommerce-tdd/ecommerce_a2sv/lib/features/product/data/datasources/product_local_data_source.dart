
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<void> cacheAllProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource{
  @override
  Future<void> cacheAllProducts(List<ProductModel> products) {
    // TODO: implement cacheAllProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

}