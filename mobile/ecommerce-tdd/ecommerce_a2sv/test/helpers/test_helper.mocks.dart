// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_a2sv/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i12;
import 'dart:typed_data' as _i14;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ecommerce_a2sv/core/error/failure.dart' as _i7;
import 'package:ecommerce_a2sv/core/platform/network_info.dart' as _i11;
import 'package:ecommerce_a2sv/features/product/data/datasources/product_local_data_source.dart'
    as _i10;
import 'package:ecommerce_a2sv/features/product/data/datasources/product_remote_data_source.dart'
    as _i9;
import 'package:ecommerce_a2sv/features/product/data/models/product_model.dart'
    as _i3;
import 'package:ecommerce_a2sv/features/product/domain/entities/product.dart'
    as _i8;
import 'package:ecommerce_a2sv/features/product/domain/repositories/product_repository.dart'
    as _i5;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i13;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductModel_1 extends _i1.SmartFake implements _i3.ProductModel {
  _FakeProductModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_3 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i5.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.Product>> getCurrentProduct(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentProduct,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i8.Product>>.value(
            _FakeEither_0<_i7.Failure, _i8.Product>(
          this,
          Invocation.method(
            #getCurrentProduct,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.Product>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Product>>> getAllProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.Product>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.Product>>(
          this,
          Invocation.method(
            #getAllProducts,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Product>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.Product>> createProduct(
          _i8.Product? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #createProduct,
          [product],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i8.Product>>.value(
            _FakeEither_0<_i7.Failure, _i8.Product>(
          this,
          Invocation.method(
            #createProduct,
            [product],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.Product>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.Product>> updateProduct(
          _i8.Product? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [product],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i8.Product>>.value(
            _FakeEither_0<_i7.Failure, _i8.Product>(
          this,
          Invocation.method(
            #updateProduct,
            [product],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.Product>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> deleteProduct(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #deleteProduct,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);
}

/// A class which mocks [ProductRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRemoteDataSource extends _i1.Mock
    implements _i9.ProductRemoteDataSource {
  MockProductRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.ProductModel> getCurrentProduct(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentProduct,
          [id],
        ),
        returnValue: _i6.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #getCurrentProduct,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.ProductModel>);

  @override
  _i6.Future<List<_i3.ProductModel>> getAllProducts() => (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue:
            _i6.Future<List<_i3.ProductModel>>.value(<_i3.ProductModel>[]),
      ) as _i6.Future<List<_i3.ProductModel>>);

  @override
  _i6.Future<_i3.ProductModel> createProduct(_i3.ProductModel? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #createProduct,
          [product],
        ),
        returnValue: _i6.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #createProduct,
            [product],
          ),
        )),
      ) as _i6.Future<_i3.ProductModel>);

  @override
  _i6.Future<_i3.ProductModel> updateProduct(_i3.ProductModel? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [product],
        ),
        returnValue: _i6.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #updateProduct,
            [product],
          ),
        )),
      ) as _i6.Future<_i3.ProductModel>);

  @override
  _i6.Future<void> deleteProduct(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [id],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [ProductLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductLocalDataSource extends _i1.Mock
    implements _i10.ProductLocalDataSource {
  MockProductLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i11.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i12.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i12.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i12.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i12.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(_i13.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i14.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i14.Uint8List>.value(_i14.Uint8List(0)),
      ) as _i6.Future<_i14.Uint8List>);

  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
