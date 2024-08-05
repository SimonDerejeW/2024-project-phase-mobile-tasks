import 'dart:convert';
import 'dart:io';

import 'product.dart';
import 'product_manager.dart';

class ECommerce {
  ProductManager manager = ProductManager();

  void run() {
    print("Welcome to my simple E-Commerce Program! Play Around!");
    print("Press 1 to view all products you have");
    print("Press 2 to view a specific product's information");
    print("Press 3 to add a new product");
    print("Press 4 to update a product");
    print("Press 5 to delete a product");
    print("Press 6 to exit the program");
    while (true) {
      print("Enter: ");
      String? command = stdin.readLineSync();
      switch (command) {
        case "1":
          manager.viewAll();
        case "2":
          print("Enter Name of the Product: ");
          String? name = stdin.readLineSync();
          this.viewOne(name);
        case "3":
          print("Enter Name of the Product: ");
          String? name = stdin.readLineSync();
          print("Enter Price of the Product: ");
          String? price = stdin.readLineSync();
          print("Enter Description of the Product: ");
          String? description = stdin.readLineSync();
          this.add(name, price, description);
        case "4":
          print("Enter the name of the product you want to update: ");
          String? name = stdin.readLineSync();
          print(
              "Enter the new name of the Product (Leave empty if change is unneccessary): ");
          String? updatedName = stdin.readLineSync();
          print(
              "Enter the new price of the Product (Leave empty if change is unneccessary): ");
          String? updatedPrice = stdin.readLineSync();
          print(
              "Enter the new description of the Product (Leave empty if change is unneccessary): ");
          String? updatedDescription = stdin.readLineSync();
          this.update(name, updatedName, updatedPrice, updatedDescription);
        case "5":
          print("Enter the name of the product you want to delete");
          String? name = stdin.readLineSync();
          this.delete(name);
        case "6":
          print("Exiting...");
          return;
        default:
          print("Invalid Input!");
          break;
      }
    }
  }

  void viewOne(String? name) {
    if (name != null) {
      manager.viewOne(name);
    } else {
      print("Enter a valid name");
    }
  }

  void delete(String? name) {
    if (name != null) {
      manager.deleteProduct(name);
    } else {
      print("Enter a valid name");
    }
  }

  void add(String? name, String? priceInput, String? description) {
    try {
      if (name != null && priceInput != null && description != null) {
        if (name.length != 0 &&
            priceInput.length != 0 &&
            description.length != 0) {
          double price = double.parse(priceInput);
          manager.addProducts(Product(name, price, description));
        } else {
          print("Any of the fields can't be empty! Try Again");
        }

      } else {
        print("Error Parsing Input");
      }
    } catch (e) {
      print("Error parsing input. Try again");
    }
  }

  void update(String? name, String? updatedName, String? updatedpriceInput,
      String? updatedDescription) {
    try {
      if (name != null )  {
        if (updatedpriceInput != null) {
          
          manager.updateProduct(
              name: name,
              updatedName: updatedName,
              updatedPrice: updatedpriceInput,
              updatedDescription: updatedDescription);
        } else {
          manager.updateProduct(
              name: name,
              updatedName: updatedName,
              updatedDescription: updatedDescription);
        }
      } else {
        print("Enter a valid name");
      }
    } catch (e) {
      print("Error parsing input. Try again");
    }
  }
}

void main() {
  ECommerce app = ECommerce();
  app.run();
}
