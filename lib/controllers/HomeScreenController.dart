import 'package:get/get.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../util/app_themes.dart';
import '../util/getStorageKey.dart';
class HomeScreenController extends GetxController with StateMixin<dynamic> {

  late final GetStorage _getStorage;
  var isDarkMode = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    _getStorage = GetStorage();
    isDarkMode.value = _getStorage.read(GetStorageKey.IS_DARK_MODE);
  }

  void changeTheme(BuildContext context) {

    if (kDebugMode) {
      print("isDarkMode==>${ GetStorage().read(GetStorageKey.IS_DARK_MODE)}");
    }
    final theme =
    GetStorage().read(GetStorageKey.IS_DARK_MODE) ? AppThemes.lightThemeData : AppThemes.darkThemeData;
    ThemeSwitcher.of(context).changeTheme(theme: theme);
    if (_getStorage.read(GetStorageKey.IS_DARK_MODE)) {
      _getStorage.write(GetStorageKey.IS_DARK_MODE, false);
      isDarkMode.value = false;
    } else {
      _getStorage.write(GetStorageKey.IS_DARK_MODE, true);
      isDarkMode.value = true;
    }
  }
}
