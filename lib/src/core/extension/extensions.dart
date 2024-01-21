extension StringExtension on String? {
  String get capitalizeFirstThen {
    return '${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}';
  }

  String get capitalizeFirstLetter {
    return '${this?.substring(0, 1).toUpperCase()}${this?.substring(1)}';
  }

  String get capitalizeEach {
    String statement = '';

    if (this != null) {
      final input = this!.replaceAll('_', ' ').trim().toLowerCase();
      for (int i = 0; i < input.length; i++) {
        if (input[i] == ' ') {
          statement += ' ${input[i + 1].replaceAll(
            input[i + 1],
            input[i + 1].toUpperCase(),
          )}';
        } else if (i == 0) {
          statement = input[0].toUpperCase();
        } else {
          if (input[i - 1] != ' ') {
            statement += input[i];
          }
        }
      }
    }

    return statement;
  }

  DateTime? get toDateTime {
    if (this!.contains('/')) {
      final parts = this!.split('/');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      return DateTime(year, month, day);
    } else if (this!.contains('-')) {
      final parts = this!.split('-');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      return DateTime(year, month, day);
    } else {
      return null;
    }
  }

  bool get isEmptyOrNull {
    if (this == null) {
      return true;
    } else {
      if (this!.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }
}

extension DateTimeExtension on DateTime {
  String get toDateString {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  String get timeRemaining {
    final dif = difference(DateTime.now());

    int days = dif.inDays;
    int hours = dif.inHours.remainder(24);
    int minutes = dif.inMinutes.remainder(60);

    return '${days}days : ${hours}hrs : ${minutes}min';
  }
}
