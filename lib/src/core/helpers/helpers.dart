import 'package:dart_date/dart_date.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pey/src/core/dependencies/timezones.dart';
import 'package:timezone/timezone.dart';

import '../resources/colors.dart';

void pp(Object? o) {
  if (kDebugMode) {
    print('$o');
  }
}

void showSnackBar(context, String message, {isError}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: isError != null && isError ? Colors.amber : Colors.white,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18),
      showCloseIcon: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: const BorderSide(color: Colors.white12),
      ),
      backgroundColor: Palette.background.withOpacity(0.8),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

String getTransactionTime(DateTime time) {
  final enFormat = time.format('MMM dd y, h:mm: a');
  return enFormat;
}

String getPostTime(DateTime time) {
  final now = TZDateTime.from(DateTime.now(), lagos);
  final difference = now.difference(time);

  if (difference < const Duration(minutes: 1)) {
    return '${difference.inSeconds}s';
  } else if (difference < const Duration(hours: 1)) {
    return '${difference.inMinutes}m';
  } else if (difference < const Duration(hours: 24)) {
    return '${difference.inHours}h';
  } else if (difference < const Duration(days: 7)) {
    return '${difference.inDays}d';
  } else if (difference > const Duration(days: 7) &&
      difference < const Duration(days: 30)) {
    return '${difference.inDays ~/ 7}w';
  } else if (difference > const Duration(days: 30)) {
    return '${(difference.inDays / 30).round()}m';
  } else {
    return '';
  }
}

copyToClipBoard(context,
    {required String text,
    bool showToastMessage = true,
    String toastText = "Copied"}) {
  Clipboard.getData(Clipboard.kTextPlain).then((value) {
    if (showToastMessage) {
      showSnackBar(context, toastText);
    }
  });
}
