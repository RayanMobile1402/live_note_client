import 'package:dio/dio.dart';

import '../../shared/models/api_method.dart';
import '../handlers/error_handler/error_handler_view_model.dart';
import '../parameters/parameters.dart';
import 'refresh_token.dart';

class CustomInterceptor extends Interceptor {
  @override
  Future<void> onResponse(
    final Response<dynamic> response,
    final ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == 204) {
      final ErrorHandlerViewModel errorModel = ErrorHandlerViewModel(
        isSuccess: false,
        message: 'No Content!',
        status: 3,
        statusCode: '204',
      );

      final Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: errorModel.toJson(),
        statusCode: 204,
      );
      handler.next(response);
    } else {
      if (response.statusCode == 200 || response.statusCode == 302) {
        return super.onResponse(response, handler);
      } else {
        if (response.statusCode.toString() == '401') {
          final res =
              await RefreshTokenHandler().refreshTokenAndCallFailedRequest(
            mainUrl: response.requestOptions.uri.toString(),
            mainMethod: ApiMethod.convertStringToApiMethod(
              response.requestOptions.method,
            ),
            body: response.requestOptions.data,
          );

          res.fold(
            (final error) {
              response.data = error.toJson();

              if (response.statusCode.toString() != error.statusCode) {
                response.statusCode = int.parse(error.statusCode ?? '100');
              }

              handler.reject(DioError(requestOptions: response.requestOptions));
            },
            handler.resolve,
          );
        } else {
          handler.reject(DioError(
            requestOptions: response.requestOptions,
          ));

          return super.onResponse(response, handler);
        }
      }
    }
  }

  @override
  Future<void> onError(
    final DioError err,
    final ErrorInterceptorHandler handler,
  ) async {
    /// Handel TimeOut Error
    if (err.response == null || err.type == DioExceptionType.unknown) {
      final ErrorHandlerViewModel errorModel = ErrorHandlerViewModel(
        isSuccess: false,
        message: 'Connecting timed out. Please check your network',
        statusCode: 'network',
        status: 3,
      );
      final Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: errorModel.toJson(),
      );

      handler.next(
        DioError(
          requestOptions: err.requestOptions,
          response: response,
        ),
      );
    } else {
      if (err.response!.statusCode.toString() == '401') {
        final res =
            await RefreshTokenHandler().refreshTokenAndCallFailedRequest(
          mainUrl: err.response!.requestOptions.uri.toString(),
          mainMethod: ApiMethod.convertStringToApiMethod(
            err.response!.requestOptions.method,
          ),
          body: err.requestOptions.data,
        );

        res.fold(
          (final error) {
            err.response!.data = error.toJson();

            if (err.response!.statusCode.toString() != error.statusCode) {
              err.response!.statusCode = int.parse(error.statusCode ?? '100');
            }
            handler.reject(err);
          },
          handler.resolve,
        );
      } else {
        if (err.response!.statusCode.toString() == '500') {
          // CrashlyticsHandler.recordFatalError(
          //   error:
          //       '${err.response?.data} =========> Url ==>\n\n\n==> ${err.requestOptions.path}',
          // );
        }
        handler.next(err);
      }
    }
  }

  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) {
    options.headers = Parameters.getHeader();

    return super.onRequest(options, handler);
  }
}
