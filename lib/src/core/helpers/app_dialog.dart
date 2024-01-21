import 'package:flutter/material.dart';
import '../resources/colors.dart';

import '../widgets/app_loading_view.dart';

Future<dynamic> showAppDialog(
  BuildContext context,
  Widget child,
) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Palette.textColor,
    isScrollControlled: true,
    isDismissible: false,
    builder: (context) {
      return child;
    },
  );
}

Future<dynamic> showLoadingDialog(
  BuildContext context,
) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Palette.buttonColor.withOpacity(0.8),
    builder: (context) {
      return const LoadingView();
    },
  );
}

Future<dynamic> showOverlay(BuildContext context, final Widget child,
    {bool? isDismissible}) async {
  return showDialog(
    context: context,
    barrierDismissible: isDismissible ?? false,
    barrierColor: Palette.buttonColor.withOpacity(0.8),
    builder: (context) {
      return child;
    },
  );
}
