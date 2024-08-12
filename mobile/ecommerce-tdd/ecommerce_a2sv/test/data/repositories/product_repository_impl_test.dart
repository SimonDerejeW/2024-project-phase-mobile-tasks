import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_a2sv/core/error/exception.dart';
import 'package:ecommerce_a2sv/core/error/failure.dart';
import 'package:ecommerce_a2sv/features/product/data/models/product_model.dart';
import 'package:ecommerce_a2sv/features/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_a2sv/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late MockProductLocalDataSource mockProductLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late ProductRepositoryImpl productRepositoryImpl;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    mockProductLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    productRepositoryImpl = ProductRepositoryImpl(
        remoteDataSource: mockProductRemoteDataSource,
        localDataSource: mockProductLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  const testProductModel = ProductModel(
      id: '1',
      name: 'Test Pineapple',
      description: 'A yellow pineapple for the summer',
      imageUrl: 'pineapple.jpg',
      price: 5.33);
  const testProductModelList = [
    ProductModel(
        id: '1',
        name: 'Test Pineapple',
        description: 'A yellow pineapple for the summer',
        imageUrl: 'pineapple.jpg',
        price: 5.33)
  ];
  const testProductEntityList = [
    Product(
        id: '1',
        name: 'Test Pineapple',
        description: 'A yellow pineapple for the summer',
        imageUrl: 'pineapple.jpg',
        price: 5.33)
  ];
  const testProductEntity = Product(
      id: '1',
      name: 'Test Pineapple',
      description: 'A yellow pineapple for the summer',
      imageUrl: 'pineapple.jpg',
      price: 5.33);
  const testProductId = '1';

  group('get current product test', () {
    test(
        'should return a product when a call to the remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getCurrentProduct(testProductId))
          .thenAnswer((_) async => testProductModel);

      //act
      final result =
          await productRepositoryImpl.getCurrentProduct(testProductId);

      //assert
      expect(result, equals(const Right(testProductEntity)));
    });
    test(
        'should return a server failure when a call to the remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getCurrentProduct(testProductId))
          .thenThrow(ServerException());
      //act
      final result =
          await productRepositoryImpl.getCurrentProduct(testProductId);

      //assert
      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });
    test('should return connection failure when the device has no internet',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getCurrentProduct(testProductId))
          .thenThrow(
              const SocketException('Failed to connect to the internet'));
      //act
      final result =
          await productRepositoryImpl.getCurrentProduct(testProductId);

      //assert
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the internet'))));
    });
  });

  group('get all products', () {
    test(
        'should return a list of products when a call to the remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getAllProducts())
          .thenAnswer((_) async => testProductModelList);

      //act
      final result = await productRepositoryImpl.getAllProducts();

      final unpackedResult =
          result.fold((failure) => null, (productList) => productList);

      //assert
      expect(unpackedResult, equals(testProductEntityList));
    });
    test(
        'should return a server failure when a call to the remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getAllProducts())
          .thenThrow(ServerException());
      //act
      final result = await productRepositoryImpl.getAllProducts();

      //assert
      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });
    test('should return connection failure when the device has no internet',
        () async {
      //arrange
      when(mockProductRemoteDataSource.getAllProducts()).thenThrow(
          const SocketException('Failed to connect to the internet'));
      //act
      final result = await productRepositoryImpl.getAllProducts();

      //assert
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the internet'))));
    });
  });


    group('create a product', () {
    test(
        'should return a product when a call to the remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.createProduct(testProductModel))
          .thenAnswer((_) async => testProductModel);

      //act
      final result =
          await productRepositoryImpl.createProduct(testProductEntity);

      //assert
      expect(result, equals(const Right(testProductEntity)));
    });
    test(
        'should return a server failure when a call to the remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.createProduct(testProductModel))
          .thenThrow(ServerException());
      //act
      final result =
          await productRepositoryImpl.createProduct(testProductEntity);

      //assert
      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });
    test('should return connection failure when the device has no internet',
        () async {
      //arrange
      when(mockProductRemoteDataSource.createProduct(testProductModel))
          .thenThrow(
              const SocketException('Failed to connect to the internet'));
      //act
      final result =
          await productRepositoryImpl.createProduct(testProductEntity);

      //assert
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the internet'))));
    });
  });

  group('update a product', () {
    test(
        'should return an updated product when a call to the remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.updateProduct(testProductModel))
          .thenAnswer((_) async => testProductModel);

      //act
      final result =
          await productRepositoryImpl.updateProduct(testProductEntity);

      //assert
      expect(result, equals(const Right(testProductEntity)));
    });
    test(
        'should return a server failure when a call to the remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.updateProduct(testProductModel))
          .thenThrow(ServerException());
      //act
      final result =
          await productRepositoryImpl.updateProduct(testProductEntity);

      //assert
      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });
    test('should return connection failure when the device has no internet',
        () async {
      //arrange
      when(mockProductRemoteDataSource.updateProduct(testProductModel))
          .thenThrow(
              const SocketException('Failed to connect to the internet'));
      //act
      final result =
          await productRepositoryImpl.updateProduct(testProductEntity);

      //assert
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the internet'))));
    });
  });

  group('delete a product', () {
    test(
        'should return a unit when a call to the remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.deleteProduct(testProductId))
          .thenAnswer((_) async => unit);

      //act
      final result =
          await productRepositoryImpl.deleteProduct(testProductId);

      //assert
      expect(result, equals(const Right(unit)));
    });
    test(
        'should return a server failure when a call to the remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDataSource.deleteProduct(testProductId))
          .thenThrow(ServerException());
      //act
      final result =
          await productRepositoryImpl.deleteProduct(testProductId);

      //assert
      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });
    test('should return connection failure when the device has no internet',
        () async {
      //arrange
      when(mockProductRemoteDataSource.deleteProduct(testProductId))
          .thenThrow(
              const SocketException('Failed to connect to the internet'));
      //act
      final result =
          await productRepositoryImpl.deleteProduct(testProductId);

      //assert
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the internet'))));
    });
  });
}
