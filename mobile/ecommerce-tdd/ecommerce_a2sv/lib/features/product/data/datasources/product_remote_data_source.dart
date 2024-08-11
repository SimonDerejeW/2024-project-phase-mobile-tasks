import '../models/product_model.dart';

abstract class ProductRemoteDataSource {

  Future<ProductModel> getCurrentProduct(String id);
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

