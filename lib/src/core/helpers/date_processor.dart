import 'package:intl/intl.dart';

String convertDateToReadable(DateTime dateTime) {
  final year = dateTime.year;
  final month = dateTime.month;
  final day = dateTime.day;

  return '${decodeMonth(month)} $day, $year';
}

String decodeMonth(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'May';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}

String toReadableTime(DateTime dateTime) {
  return DateFormat.jm().format(dateTime);
}
