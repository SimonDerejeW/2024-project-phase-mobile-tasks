import 'dart:convert';

import 'package:ecommerce_a2sv/core/error/exception.dart';
import 'package:ecommerce_a2sv/features/product/data/models/product_model.dart';
import 'package:ecommerce_a2sv/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testProductModel = ProductModel(
      id: '1',
      name: 'Product 1',
      description: 'Product 1 description',
      imageUrl: 'product1.jpg',
      price: 100);

  test('should be a subclass of product entity', () async {
    //assert
    expect(testProductModel, isA<Product>());
  });

  test('should return a valid model from json', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json
        .decode(readJson('helpers/fixtures/dummy_product_response.json'))[0];

    //act
    final result = ProductModel.fromJson(jsonMap);

    //assert
    expect(result, equals(testProductModel));
  });

  test('should return a json map containing proper data', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json
        .decode(readJson('helpers/fixtures/dummy_product_response.json'))[0];

    //act
    final result = testProductModel.toJson();

    //assert
    expect(result, jsonMap);
  });

  test('should throw an exception if fails to cast json to model', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json
        .decode(readJson('helpers/fixtures/dummy_product_response.json'))[1];

    //act and assert
    expect(
        () => ProductModel.fromJson(jsonMap),
        throwsA(isA<JsonParsingException>().having(
            (e) => e.message,
            'error message',
            contains('Failed to cast json to product model'))));
  });
}