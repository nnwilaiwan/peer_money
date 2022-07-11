import 'dart:io';

import 'package:flutter/cupertino.dart';

class AppTextSetting {
  //main App
  static const String APP_FONT = 'Inter';
  // static const String APP_FONT_SECOND = 'Kanit';
  // static const String APP_FONT_BOLD = 'DBMomentXBold';
  // static const String NOTIFICATION_TOKEN = 'Wait Token';
  // static const double FONT_SIZE_SMALL = 14;
  // static const double FONT_SIZE_MEDIUM = 18;
  // static const double FONT_SIZE_BIG = 20;

  // static const double RESTPONSIVE_FONT_SIZE_SMALL = 0.03;
  // static const double RESTPONSIVE_FONT_SIZE_MEDIUM = 0.05;
  // static const double RESTPONSIVE_FONT_SIZE_BIG = 0.08;

//Text Navbar
  //Home Screen
  static const String BTB_TITLE_0 = "Home";
  static const String BTB_TITLE_1 = "Assets";
  static const String BTB_TITLE_2 = "Loan";
  static const String BTB_TITLE_3 = "Profile";
  static const int COUNTNONTIFY = 1;

//Color
  static const COLOR_LIGHT_GREY = Color(0xFFECECEC);
  static const COLOR_PRIMARY = Color(0xFFffba00);
  static const COLOR_GREEN = Color(0xFF34A156);

//Assets
  static const dynamic ASSETS_VALUE = [
    {
      "image": "assets/icons/btc-assets.png",
      "title": "Bitcoin",
      "name": "BTC",
      "value1": "4.560000",
      "value2": "~฿4,560,000.00",
    },
    {
      "image": "assets/icons/eth-assets.png",
      "title": "Ethereum",
      "name": "ETH",
      "value1": "4.560000",
      "value2": "~฿4,560,000.00",
    },
    {
      "image": "assets/icons/xrp.png",
      "title": "Ripple",
      "name": "XRP",
      "value1": "4.560000",
      "value2": "~฿4,560,000.00",
    },
    {
      "image": "assets/icons/usdc-assets.png",
      "title": "USD Coin",
      "name": "USDC",
      "value1": "4.560000",
      "value2": "~฿4,560,000.00",
    }
  ];
}
