import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:ffood/util/app_themes.dart';
import 'package:ffood/util/getStorageKey.dart';import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ffood/helper/dependency.dart' as dep;

import 'Route/Routes.dart';
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    bool isDarkMode = getStorage.read(GetStorageKey.IS_DARK_MODE) ?? false;
    getStorage.write(GetStorageKey.IS_DARK_MODE, isDarkMode);

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return ThemeProvider(
              initTheme: isDarkMode ? AppThemes.darkThemeData : AppThemes
                  .lightThemeData,
              builder: (_, myTheme) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  useInheritedMediaQuery: true,
                  locale: DevicePreview.locale(context),
                  darkTheme: AppThemes.darkThemeData,
                  builder: DevicePreview.appBuilder,
                  // theme: ThemeData.dark(), // default dark theme replaces default light theme
                  theme: myTheme,
                  title: 'Flutter Demo',
                  getPages: Routes.routes,
                  initialRoute: Routes.welcomeScreen,
                );
              }
          );
        });
  }
}
