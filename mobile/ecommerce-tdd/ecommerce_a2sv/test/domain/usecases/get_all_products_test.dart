import 'package:dartz/dartz.dart';
import 'package:ecommerce_a2sv/core/error/failure.dart';
import 'package:ecommerce_a2sv/features/product/domain/entities/product.dart';
import 'package:ecommerce_a2sv/features/product/domain/usecases/get_all_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetAllProductsUsecase getAllProductsUsecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getAllProductsUsecase = GetAllProductsUsecase(mockProductRepository);
  });

  const testProductDetail = [
    Product(
        id: '1',
        name: 'Nike',
        description: 'Nike Sneakers for day-to-day use',
        imageUrl: 'imageUrl',
        price: 10),
    Product(
        id: '2',
        name: 'Addidas',
        description: 'Addidas Sneakers for day-to-day use',
        imageUrl: 'imageUrl',
        price: 20),
  ];

  test('should get all products from the repository', () async {
    //arrange
    when(mockProductRepository.getAllProducts())
        .thenAnswer((_) async => const Right(testProductDetail));

    //act
    final result = await getAllProductsUsecase.execute();

    //assert
    expect(result, const Right(testProductDetail));
  });

    test('should return a failure when failure occurs', () async {
    //arrange
    when(mockProductRepository.getAllProducts())
        .thenAnswer((_) async => const Left(ServerFailure('test error message')));

    //act
    final result = await getAllProductsUsecase.execute();

    //expect
    expect(result, const Left(ServerFailure('test error message')));
  });
}
