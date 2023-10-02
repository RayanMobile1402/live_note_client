import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../handlers/error_handler/error_handler_view_model.dart';
import 'custom_interceptor.dart';
import 'logger_interceptor.dart';

class AppHttpClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  AppHttpClient() {
    if (!kIsWeb) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (final cert, final host, final port) => true;
    }
    if (kDebugMode) {
      dio.interceptors.addAll([
        CustomInterceptor(),
        CustomLogger(),
      ]);
    } else {
      dio.interceptors.addAll([
        CustomInterceptor(),
      ]);
    }
  }

  Future<Either<ErrorHandlerViewModel, Response<T>>> get<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await dio.get<T>(
        path,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      final value = ErrorHandlerViewModel.parseDioError(dioError.response!);

      return Left(value);
    }
  }

  Future<Either<ErrorHandlerViewModel, Response<T>>> post<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await dio.post<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      final value = ErrorHandlerViewModel.parseDioError(dioError.response!);

      return Left(value);
    }
  }

  Future<Either<ErrorHandlerViewModel, Response<T>>> put<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await dio.put<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      final value = ErrorHandlerViewModel.parseDioError(dioError.response!);

      return Left(value);
    }
  }

  Future<Either<ErrorHandlerViewModel, Response<T>>> patch<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await dio.patch<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      final value = ErrorHandlerViewModel.parseDioError(dioError.response!);

      return Left(value);
    }
  }

  Future<Either<ErrorHandlerViewModel, Response<T>>> delete<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
  }) async {
    try {
      final res = await dio.delete<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      final value = ErrorHandlerViewModel.parseDioError(dioError.response!);

      return Left(value);
    }
  }
}
