import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class StoredMedia extends Equatable {
  final Uint8List data;
  final String type;
  final String filePath;

  const StoredMedia(this.data, this.type, this.filePath);

  @override
  List<Object?> get props => [data, type];
}
