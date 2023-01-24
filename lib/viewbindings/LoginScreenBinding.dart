import 'package:ffood/controllers/LoginController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';

import '../controllers/HomeScreenController.dart';


class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>LoginScreenController());
  }


}