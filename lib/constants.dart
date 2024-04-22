import 'package:flutter/material.dart';

const Color primaryDarkColorDark = Color(0xff2e3c62);
const Color primaryColorDark = Color(0xff99ace1);
const Color mainTextColorDark = Colors.white;

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
