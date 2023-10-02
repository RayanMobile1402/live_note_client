import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/api_method.dart';
import '../../shared/models/refresh_token_model.dart';
import '../handlers/error_handler/error_handler_view_model.dart';
import '../parameters/api_end_point.dart';
import '../parameters/local_storage_key.dart';
import '../parameters/parameters.dart';
import 'app_http_client.dart';

class RefreshTokenHandler {
  static final AppHttpClient _appHttpClient = AppHttpClient();
  bool _keepGoing = false;
  Duration timeout = const Duration(seconds: Parameters.timeoutTime);

  Future<void> execute() async {
    if (!_keepGoing) {
      _keepGoing = true;
      while (_keepGoing) {
        if (!_keepGoing) {
          return;
        }
        final int expireTimeInSecond =
            ((Parameters.accessTokenExpirationDateTime!.millisecondsSinceEpoch) /
                1000).round();
        await Future<void>.delayed(Duration(seconds: expireTimeInSecond));
        await Future<void>.delayed(const Duration(seconds: 1));

        /// it is for when the duration gets negative, so we delay 1 sec to make delay to ultimate loop
        await refreshToken();
      }
    }
  }

  Future<void> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    print('refresh token in progresss>>>>>>>>>>>>>>>>>>');

    final Map<String, dynamic> data = {};
    data['currentRefreshToken'] = Parameters.refreshToken;
    data['isLongTermLogin'] = false;
    print('refresh token data ${json.encode(data)}');
    print(
      'refresh token url ${Uri.parse(
        ApiEndPoint.baseUrl + Parameters.refreshToken!,
      )}',
    );
    final responseToken = await _appHttpClient.post<Map<String, dynamic>>(
      ApiEndPoint.refreshTokenUrl,
      data: data,
    );

    late final Response<Map<String, dynamic>> refreshData;

    responseToken.fold(
      (l) => null,
      (r) => refreshData = r,
    );

    print(
      'call Refresh Token \n'
      'refresh token : ${json.encode(data)}\n'
      'refresh token url : ${ApiEndPoint.baseUrl}${Parameters.refreshToken}\n'
      'body : ${refreshData.data}\n',
    );
    if (refreshData.statusCode == 401) {
      stop();
    }

    final RefreshTokenModel refreshToken =
        RefreshTokenModel.fromJson(refreshData.data!);

    if (refreshToken.isSuccess!) {
      Parameters.accessToken = refreshToken.accessToken;
      Parameters.refreshToken = refreshToken.refreshToken;
      final Map<String, dynamic> decodedToken =
          JwtDecoder.decode(refreshToken.accessToken);
      final int timeStamp = decodedToken['exp'];

      Parameters.accessTokenExpirationDateTime =
          DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);

      await setTokenInfo(refreshToken, timeStamp);
    }
  }

  void stop() {
    print('RefreshTokenHandler stop');
    _keepGoing = false;
  }

  FutureOr<Either<ErrorHandlerViewModel, Response<T>>>
      refreshTokenAndCallFailedRequest<T>({
    required final String mainUrl,
    required final ApiMethod mainMethod,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic body,
    final CancelToken? cancelToken,
    final String? mainData,
  }) async {
    print('refresh token in progresss >>>>>>>>>>>>>>>>>>');

    final Map<String, dynamic> data = {};
    data['currentRefreshToken'] = Parameters.refreshToken;
    data['isLongTermLogin'] = false;
    print('refresh token data ${json.encode(data)}');
    print(
      'refresh token url ${Uri.parse(
        ApiEndPoint.baseUrl + Parameters.refreshToken!,
      )}',
    );
    final responseToken = await _appHttpClient.post<Map<String, dynamic>>(
      ApiEndPoint.baseUrl + Parameters.refreshToken!,
      data: json.encode(data),
    );
    late final Map<String, dynamic> refreshData;
    responseToken.fold(
      (final l) => null,
      (final r) => refreshData = r.data!,
    );

    print(
      'call Refresh Token \n'
      'refresh token : ${json.encode(data)}\n'
      'refresh token url : ${ApiEndPoint.baseUrl} + ${Parameters.refreshToken!}\n'
      'body : $refreshData\n',
    );

    final RefreshTokenModel rmRefreshToken =
        RefreshTokenModel.fromJson(refreshData);
    late Either<ErrorHandlerViewModel, Response<T>> response;

    if (rmRefreshToken.isSuccess!) {
      Parameters.accessToken = rmRefreshToken.accessToken;
      Parameters.refreshToken = rmRefreshToken.refreshToken;
      final Map<String, dynamic> decodedToken =
          JwtDecoder.decode(rmRefreshToken.accessToken);
      final int timeStamp = decodedToken['exp'];

      Parameters.accessTokenExpirationDateTime =
          DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);

      await setTokenInfo(rmRefreshToken, timeStamp);

      switch (mainMethod) {
        case ApiMethod.post:
          response = await _appHttpClient.post(
            mainUrl,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            data: body,
          );
          break;
        case ApiMethod.get:
          response = await _appHttpClient.get(
            mainUrl,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          );
          break;
        case ApiMethod.patch:
          response = await _appHttpClient.patch(
            mainUrl,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            data: body,
          );
          break;
        case ApiMethod.delete:
          response = await _appHttpClient.delete(
            mainUrl,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            data: body,
          );
          break;
        case ApiMethod.put:
          response = await _appHttpClient.put(
            mainUrl,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            data: body,
          );
          break;
      }
    }

    return response.fold(
      (final error) {
        print('refresh token method has error $error');
        // Utils.logoutUser();
        return Left(error);
      },
      Right.new,
    );
  }

  Future<void> setTokenInfo(
    final RefreshTokenModel refreshToken,
    final int timeStamp,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      LocalStorageKey.apiToken,
      refreshToken.accessToken,
    );
    await prefs.setString(
      LocalStorageKey.refreshToken,
      refreshToken.refreshToken,
    );
    await prefs.setInt('accessTokenExpirationDateTime', timeStamp);
  }
}
