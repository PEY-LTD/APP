import 'package:equatable/equatable.dart';
import 'meta.dart';
import '../resources/enum.dart';

class ApiData extends Equatable {
  final dynamic data;
  final ApiStatus status;
  final String message;
  final Meta meta;
  Type get type => data.runtimeType;

  const ApiData({
    required this.data,
    required this.status,
    required this.message,
    required this.meta,
  });

  @override
  List<Object?> get props => [data, status, type, message, meta];
}
