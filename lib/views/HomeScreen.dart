import 'package:ffood/Route/Routes.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:ffood/controllers/HomeScreenController.dart';

import 'package:ffood/controllers/WelcomeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/app_colors.dart';




class HomeScreen extends GetView<HomeScreenController>

{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  ThemeSwitchingArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,

          actions: [ThemeSwitcher(
              builder: (context) => Obx(() => IconButton(
                icon: controller.isDarkMode.value
                    ? const Icon(CupertinoIcons.brightness)
                    : Icon(
                  CupertinoIcons.moon_stars,
                  color: AppColors().kPrimaryTextColor,
                ),
                onPressed: () {
                  controller.changeTheme(context);
                },
              )))],
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value:   SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors().kPrimaryTextColor, // Navigation bar
            statusBarColor: AppColors().kPrimaryTextColor, //

              // Status bar
          ),
          child: GestureDetector(onTap:(){
            Get.toNamed(Routes.loginScreen);

          },child: Container(color: AppColors.white,
          child: Text("ass"),)),
        ),
      ),
    );;
  }

}