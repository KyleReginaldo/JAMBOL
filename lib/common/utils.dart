import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jumbled/presentation/component/typography/j_text.dart';

class Utils {
  Utils._();

  static Future<void> showSnackBar({
    required BuildContext context,
    required String content,
    Widget? iconButton,
    required Color bgColor,
    Color? textColor,
    double? bottomMargin,
  }) async {
    var msgr = ScaffoldMessenger.of(context);
    SnackBar snackBar = SnackBar(
      content: JText(
        content,
        weight: FontWeight.w500,
        size: 15,
      ),
      backgroundColor: bgColor,
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      duration: const Duration(seconds: 2),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * 0.88,
        left: 24,
        right: 24,
      ),
    );
    msgr.clearSnackBars();
    msgr.showSnackBar(snackBar);
  }
}
