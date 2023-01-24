import 'package:ffood/Route/Routes.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:ffood/controllers/LoginController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/app_colors.dart';




class LoginScreen extends GetView<LoginScreenController>
{
  TextEditingController passwordController = TextEditingController(text: "");



  @override
  Widget build(BuildContext context) {

    return  ThemeSwitchingArea(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value:   SystemUiOverlayStyle(
              systemNavigationBarColor: AppColors().kPrimaryTextColor, // Navigation bar
              statusBarColor: AppColors().kPrimaryTextColor, //

                // Status bar
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: Stack(
                children: [
                  Container(
                    height:48.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2.0,
                          ),
                        ],
                        color: AppColors.white),
                  ),
                  Container(
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                child: Icon(Icons.abc),)),
                          contentPadding: EdgeInsets.all(15.0),
                          fillColor: AppColors.themeColor,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: AppColors.themeColor),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: AppColors.acceptColor,fontSize:15.0),
                          hintText: "Password"),
                     obscureText: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );;
  }

}