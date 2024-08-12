import 'package:http/http.dart' as http;
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {

  Future<ProductModel> getCurrentProduct(String id);
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});
  
  @override
  Future<ProductModel> createProduct(ProductModel product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<List<ProductModel>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
  
  @override
  Future<ProductModel> getCurrentProduct(String id) {
    // TODO: implement getCurrentProduct
    throw UnimplementedError();
  }
  
  @override
  Future<ProductModel> updateProduct(ProductModel product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
  
}