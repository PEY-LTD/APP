import 'dart:developer';

import 'package:pey/src/core/storage/database.dart';

import 'package:pey/src/core/apis/api_auth.dart';
import 'package:pey/src/core/apis/api_endpoints.dart';
import 'package:pey/src/core/helpers/helpers.dart';
import 'package:dio/dio.dart';
import 'package:pey/src/core/errors/exception.dart';
import 'package:pey/src/core/storage/storage.dart';

Future<String> reAuth(Dio dio) async {
  final authData = getStorage(path: DB.AUTH);
  if (authData != null) {
    try {
      final response = await dio.post(
        refreshTokenUrl,
        data: {
          'refreshToken': authData['refreshToken'],
        },
      );

      if (response.statusCode == 200) {
        // Update your access token with the new token
        final accessToken = response.data['accessToken'];

        setStorage(
          key: DB.AUTH,
          value: {
            "accessToken": accessToken,
            "refreshToken": authData['refreshToken']
          },
        );

        return accessToken;
      } else {
        log('Token Refresh failed');

        // Handle token refresh failure
        throw UnAuthenticatedException(message: 'Token refresh failed');
      }
    } catch (e) {
      // Handle network or other errors
      rethrow;
    }
  } else {
    throw UnAuthenticatedException();
  }
}

class DioManager {
  final Dio dio;

  DioManager(this.dio);

  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    dio.options.headers = options.headers;
    handler.next(options);
  }

  void onResponse(options, ResponseInterceptorHandler handler) async {
    // pp(options.statusCode);
    handler.resolve(options);
  }

  void onError(DioException e, ErrorInterceptorHandler handler) async {
    if (e.response?.statusCode == 401) {
      try {
        // Refresh the token
        final accessToken = await reAuth(dio);

        // Retry the original request
        final originalRequest = e.requestOptions;

        final response = await dio.request(
          originalRequest.path,
          data: originalRequest.data,
          options: Options(
            headers: headers
              ..['Content-type'] = originalRequest.headers['Content-type']
              ..['Authorization'] = 'Bearer $accessToken',
          ),
        );

        handler.resolve(response);
      } catch (exception) {
        pp(exception);
        handler.resolve(e.response!);
      }
    } else {
      log('Error');
      log('${e.response?.statusCode}');
      log('${e.response?.statusMessage}');
      if (e.error == null) {
        handler.resolve(
          e.response ??
              Response(
                data: {'message': ''},
                requestOptions: RequestOptions(),
              ),
        );
      } else {
        handler.reject(e);
      }
    }
  }
}
