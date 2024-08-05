import 'product.dart';

class ProductManager {
  Map<String, Product> _products = {};

  void addProducts(Product product) {
    if (_products[product.productName] != null) {
      print(
          "Product already exists! Try to add a new product or update the current product.");
    } else {
      _products[product.productName] = product;
    }
  }

  void viewAll() {
    if (_products.length == 0) {
      print("Your Product List is Empty!");
    } else {
      print(
          "   Product Name   |||   Product Description   |||   Product Price   ");
      _products.forEach((name, product) {
        print(
            "   ${product.productName}         |||         ${product.productDescription}        |||   ${product.productPrice}   ");
      });
    }
  }

  void viewOne(String name){
    if (_products[name] != null){
      Product? product = _products[name];
      print("Product Name: ${product?.productName}");
      print("Product Price: ${product?.productPrice}");
      print("Product Description: ${product?.productDescription}");
    } else{
      print("Product Not Found! Try a different Product");
    }
  }

  void updateProduct({required String name, String? updatedName, double? updatedPrice, String? updatedDescription}){
    if (_products[name] != null){
      Product? product = _products[name];
      if (updatedName != null){
        product?.productName = updatedName;
      } 
      if (updatedPrice != null){
        product?.productPrice = updatedPrice;
      } 
      if (updatedDescription != null){
        product?.productDescription = updatedDescription;
      }
      print("Product Updated! Here's the updated product.");
      print("Product Name: ${product?.productName}");
      print("Product Price: ${product?.productPrice}");
      print("Product Description: ${product?.productDescription}");

    } else{
      print("Product Not Found! Try a different Product");
    }
  }

  void deleteProduct(String name){
     if (_products[name] != null){
      _products.remove(name);
     }else{
      print("Product Not Found! Couldn't be deleted");
    }
  }
}


void main(){
  ProductManager manager = ProductManager();

  manager.addProducts(Product("Apple", 10.99, "An Apple a day keeps the doctor away!"));
  manager.addProducts(Product("Banana", 5.99, "A Banana a day keeps a leetcode hard away!"));
  manager.addProducts(Product("Candy", 4.99, "Candy is bad for teeth!"));
  manager.viewAll();
  
  manager.updateProduct(name: "Apple", updatedPrice: 12.99);
  manager.deleteProduct("Candy");
  manager.viewAll();
  
}