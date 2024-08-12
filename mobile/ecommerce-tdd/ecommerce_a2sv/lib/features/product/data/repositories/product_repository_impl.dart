import 'dart:io';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/product.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, Product>> createProduct (Product product) async{
    try{
      final result = await remoteDataSource.createProduct(ProductModel.toModel(product));
      return Right(result.toEntity());
    } on ServerException{
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the internet'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async{
    try{
      final result = await remoteDataSource.deleteProduct(id);
      return Right(result);
    } on ServerException{
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the internet'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async{
    try{
      final result = await remoteDataSource.getAllProducts();
      return Right(ProductModel.toEntityList(result));
    } on ServerException{
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the internet'));
    }
  }

  @override
  Future<Either<Failure, Product>> getCurrentProduct(String id) async{
    try{
      final result = await remoteDataSource.getCurrentProduct(id);
      return Right(result.toEntity());
    } on ServerException{
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the internet'));
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async{
    try{
      final result = await remoteDataSource.updateProduct(ProductModel.toModel(product));
      return Right(result.toEntity());
    } on ServerException{
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the internet'));
    }
  }
}
