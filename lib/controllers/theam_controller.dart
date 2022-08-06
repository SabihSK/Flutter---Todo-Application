import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeControllerInstance =
    ChangeNotifierProvider(((ref) => ThemeController()));

class ThemeController extends ChangeNotifier {
  void changeTheme() async {
    notifyListeners();
  }
}
