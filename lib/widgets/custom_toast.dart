import 'package:flutter/material.dart';

void showToast({required BuildContext context, required String title}) {
  final scaffold = ScaffoldMessenger.of(context);
  final screenSize = MediaQuery.of(context).size;
  scaffold.showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: screenSize.width * 0.7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      action: SnackBarAction(
        label: "CLOSE",
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ),
  );
}
