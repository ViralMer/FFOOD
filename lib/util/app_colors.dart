import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'getStorageKey.dart';


class AppColors {
  static const Color darkBlue = Color(0xff0f5eaf);

  static Color themeColor = fromHex('#FC8019');
  static Color white = fromHex('#FFFFFF');

  var kPrimaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? const Color(0xDDFFFFFF)
      : const Color(0xDD000000);
  var kSecondaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? const Color(0x89FFFFFF)
      : const Color(0x89000000);
  var kBlackColor = Colors.black;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


  ///status colors
  static Color pendingColor  = fromHex('#716acb');
  static Color acceptColor  = fromHex('#52bfa3');
  static Color rejectColor  = fromHex('#ed506c');


}
