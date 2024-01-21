import 'package:pey/src/core/helpers/date_processor.dart';

extension DateTimeExtentions on DateTime {
  String get toReadableDate => convertDateToReadable(this);
  String get toTime => toReadableTime(this);
}
