import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_a2sv/core/constants/constants.dart';
import 'package:ecommerce_a2sv/core/error/exception.dart';
import 'package:ecommerce_a2sv/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_a2sv/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl =
        ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  const productId = '6672776eb905525c145fe0bb';
  const jsonCurrent = 'helpers/fixtures/mock_product_api.json';
  const jsonAll = 'helpers/fixtures/mock_products_list_api.json';
  const testProductModel = ProductModel(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      imageUrl:
          'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
      price: 123);

  group('get current product', () {
    test('should return product model when the response code is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.currentProductById(productId))))
          .thenAnswer((_) async => http.Response(readJson(jsonCurrent), 200));

      //act
      final result =
          await productRemoteDataSourceImpl.getCurrentProduct(productId);

      //assert
      expect(result, isA<ProductModel>());
    });

    test('should throw server exception if status code is other than 200',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.currentProductById(productId))))
          .thenAnswer((_) async => http.Response(readJson(jsonCurrent), 400));

      //act and assert
      expect(() => productRemoteDataSourceImpl.getCurrentProduct(productId),
          throwsA(isA<ServerException>()));
    });

    test('should throw a socket exception if it happens', () {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.currentProductById(productId))))
          .thenThrow(const SocketException(
              'No Internet connection or server unreachable'));

      //act
      final call = productRemoteDataSourceImpl.getCurrentProduct;

      //assert
      expect(() => call(productId), throwsA(isA<SocketException>()));
    });
  });

  group('getAllProducts', () {
    test('should return a list of product models if status code is 200',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.baseUrl)))
          .thenAnswer((_) async => http.Response(readJson(jsonAll), 200));

      //act
      final result = await productRemoteDataSourceImpl.getAllProducts();

      //assert
      expect(result, isA<List<ProductModel>>());
    });

    test('should throw a server exception if status code is different from 200',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.baseUrl)))
          .thenAnswer((_) async => http.Response(readJson(jsonAll), 400));

      //act and assert
      expect(() => productRemoteDataSourceImpl.getAllProducts(),
          throwsA(isA<ServerException>()));
    });

    test('should throw a socket exception if it happens', () {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.baseUrl))).thenThrow(
          const SocketException(
              'No Internet connection or server unreachable'));

      //act
      final call = productRemoteDataSourceImpl.getAllProducts;

      //assert
      expect(() => call(), throwsA(isA<SocketException>()));
    });
  });

  group('deleteProduct', () {
    test('should delete successfully', () async {
      //arrange
      final url = Uri.parse(Urls.currentProductById(productId));
      when(mockHttpClient.delete(url))
          .thenAnswer((_) async => http.Response('', 200));

      //act
      await productRemoteDataSourceImpl.deleteProduct(productId);

      //assert
      verify(mockHttpClient.delete(url));
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // arrange
      when(mockHttpClient.delete(any))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));

      // act
      final call = productRemoteDataSourceImpl.deleteProduct;

      // assert
      expect(() => call(productId), throwsA(isA<ServerException>()));
    });
        test('should throw a socket exception if it happens', () {
      //arrange
      when(mockHttpClient.delete(any)).thenThrow(
          const SocketException(
              'No Internet connection or server unreachable'));

      //act
      final call = productRemoteDataSourceImpl.deleteProduct;

      //assert
      expect(() => call(productId), throwsA(isA<SocketException>()));
    });
  });

  group('updateProduct', () {
    test('should return an updated product model if status code is 200',
        () async {
      //arrange
      when(mockHttpClient.put(Uri.parse(Urls.currentProductById(productId)),
              body: testProductModel.toJson()))
          .thenAnswer((_) async => http.Response(readJson(jsonCurrent), 200));

      //act
      final result =
          await productRemoteDataSourceImpl.updateProduct(testProductModel);

      //assert
      expect(result, testProductModel);
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // arrange
      when(mockHttpClient.put(Uri.parse(Urls.currentProductById(productId)),
              body: testProductModel.toJson()))
          .thenAnswer((_) async => http.Response('Something went wrong', 500));

      // act
      final call = await productRemoteDataSourceImpl.updateProduct;

      // assert
      expect(() => call(testProductModel), throwsA(isA<ServerException>()));
    });

    test('should throw a socket exception if it happens', () {
      //arrange
      when(mockHttpClient.put(Uri.parse(Urls.currentProductById(productId)),body: testProductModel.toJson())).thenThrow(
          const SocketException(
              'No Internet connection or server unreachable'));

      //act
      final call = productRemoteDataSourceImpl.updateProduct;

      //assert
      expect(() => call(testProductModel), throwsA(isA<SocketException>()));
    });
    
  });

  group('createProduct', () {
    test('should return a created product model if status code is 200',
        () async {
      //arrange
      final productJson = {
        'name': testProductModel.name,
        'description': testProductModel.description,
        'imageUrl': testProductModel.imageUrl,
        'price': testProductModel.price
      };
      when(mockHttpClient.post(Uri.parse(Urls.baseUrl), body: productJson))
          .thenAnswer((_) async => http.Response(readJson(jsonCurrent), 200));

      //act
      final result =
          await productRemoteDataSourceImpl.createProduct(testProductModel);

      //assert
      expect(result, testProductModel);
    });
    test('should throw a server exception if status code is different from 200',
        () async {
      //arrange
      final productJson = {
        'name': testProductModel.name,
        'description': testProductModel.description,
        'imageUrl': testProductModel.imageUrl,
        'price': testProductModel.price
      };
      when(mockHttpClient.post(Uri.parse(Urls.baseUrl), body: productJson))
          .thenAnswer((_) async => http.Response('something went wrong', 500));

      //act
      final call = await productRemoteDataSourceImpl.createProduct;

      //assert
      expect(() => call(testProductModel), throwsA(isA<ServerException>()));
    });

    test('should throw a socket exception if it happens', () {
      //arrange
      final productJson = {
        'name': testProductModel.name,
        'description': testProductModel.description,
        'imageUrl': testProductModel.imageUrl,
        'price': testProductModel.price
      };
      when(mockHttpClient.post(Uri.parse(Urls.baseUrl), body: productJson)).thenThrow(
          const SocketException(
              'No Internet connection or server unreachable'));

      //act
      final call = productRemoteDataSourceImpl.createProduct;

      //assert
      expect(() => call(testProductModel), throwsA(isA<SocketException>()));
    });
  });
}
