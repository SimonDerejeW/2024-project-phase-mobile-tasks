import 'dart:io';

import 'package:ecommerce_a2sv/core/platform/network_info.dart';
import 'package:ecommerce_a2sv/features/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_a2sv/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_a2sv/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce_a2sv/features/product/domain/usecases/get_current_product.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks(
  [
    ProductRepository,
    ProductRemoteDataSource,
    ProductLocalDataSource,
    NetworkInfo,
    InternetConnectionChecker,
    SharedPreferences,
    GetCurrentProductUsecase
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)]
)

void main(){}