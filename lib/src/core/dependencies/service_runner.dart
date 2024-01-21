import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../errors/exception.dart';
import '../errors/failure.dart';
import '../resources/enum.dart';
import 'network_info.dart';

class ServiceRunner<Type> {
  NetworkInfo networkInfo = NetworkInfoImpl(InternetConnectionChecker());
  final Future<bool> Function(Type)? cacheTask;

  ServiceRunner({this.cacheTask});

  Future<Either<Failure, Type>> runService(Future<Type> Function() task) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await task.call();

        //Run Cache Task
        if (cacheTask != null) {
          cacheTask!(result);
        }

        //Return the Right side of the either type
        return Right(result);
      } on ServerException catch (e) {
        return Left(Failure(e.message, type: ErrorTypes.server));
      } on DioException catch (e) {
        return Left(
          Failure(
            e.response?.data['message'] ?? 'Server return error',
            type: ErrorTypes.server,
          ),
        );
      } on HandshakeException {
        return Left(Failure('Network Error', type: ErrorTypes.handshake));
      } on SocketException {
        return Left(Failure('Network Error', type: ErrorTypes.secket));
      } on FormatException {
        return Left(Failure('Invalid Response', type: ErrorTypes.format));
      } on TimeoutException {
        return Left(Failure('Request Timeout', type: ErrorTypes.timeout));
      } on Exception {
        return Left(Failure('Unknown Error', type: ErrorTypes.unknown));
      }
    } else {
      return Left(Failure('No network service', type: ErrorTypes.data));
    }
  }
}
