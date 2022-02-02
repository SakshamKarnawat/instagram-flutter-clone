import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<AppTheme, bool>((ref) {
  return AppTheme();
});

class AppTheme extends StateNotifier<bool> {
  AppTheme() : super(true);

  void setDarkTheme() => state = true;
  void setLightTheme() => state = false;
}
