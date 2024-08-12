import 'package:ecommerce_a2sv/core/platform/network_info.dart';
import 'package:ecommerce_a2sv/features/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_a2sv/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_a2sv/features/product/domain/repositories/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    ProductRepository,
    ProductRemoteDataSource,
    ProductLocalDataSource,
    NetworkInfo,
    InternetConnectionChecker
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)]
)

void main(){}