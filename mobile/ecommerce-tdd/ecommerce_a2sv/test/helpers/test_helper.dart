import 'dart:io';

import 'package:ecommerce_a2sv/core/network/custom_client.dart';
import 'package:ecommerce_a2sv/core/platform/network_info.dart';
import 'package:ecommerce_a2sv/core/usecase/usecase.dart';
import 'package:ecommerce_a2sv/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce_a2sv/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce_a2sv/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_a2sv/features/auth/domain/usecases/get_user.dart';
import 'package:ecommerce_a2sv/features/auth/domain/usecases/login.dart';
import 'package:ecommerce_a2sv/features/auth/domain/usecases/logout.dart';
import 'package:ecommerce_a2sv/features/auth/domain/usecases/register.dart';
import 'package:ecommerce_a2sv/features/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce_a2sv/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce_a2sv/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce_a2sv/features/product/domain/usecases/create_product.dart';
import 'package:ecommerce_a2sv/features/product/domain/usecases/delete_product.dart';
import 'package:ecommerce_a2sv/features/product/domain/usecases/get_all_products.dart';
import 'package:ecommerce_a2sv/features/product/domain/usecases/get_current_product.dart';
import 'package:ecommerce_a2sv/features/product/domain/usecases/update_product.dart';
import 'package:ecommerce_a2sv/features/product/presentation/bloc/product_bloc.dart';
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
    UseCase,
    GetCurrentProductUsecase,
    GetAllProductsUsecase,
    CreateProductUsecase,
    UpdateProductUsecase,
    DeleteProductUsecase,
    CustomHttpClient,
    AuthRepository,
    AuthRemoteDataSource,
    AuthLocalDataSource,
    LoginUsecase,
    RegisterUsecase,
    LogoutUsecase,
    GetUserUsecase
    
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)]
)

void main(){}