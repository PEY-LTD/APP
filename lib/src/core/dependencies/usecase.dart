import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

abstract class Usecase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
