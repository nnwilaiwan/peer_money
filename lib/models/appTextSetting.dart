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

  //Deposit
  static const dynamic DEPOSIT_LIST = [
    {
      "address": "1FyMtiZkos6NGaroZH4v",
      "date": "23.03.2017  15:43",
      "value": "+ 0.1211234 ETH",
      "status": "Pending"
    },
    {
      "address": "1HB5XMLmzFVj8ALj6mf",
      "date": "21.03.2022  10:20",
      "value": "+ 2.3245234 ETH",
      "status": "Completed"
    },
    {
      "address": "1LYm7jrZeZaEo7rye2SN",
      "date": "20.03.2022  09:00",
      "value": "- 2.5 ETH",
      "status": "Completed"
    },
    {
      "address": "1FyMtiZkos6NGaroZH4v",
      "date": "19.03.2022  20:35 ",
      "value": "- 4 ETH",
      "status": "Fail"
    },
    {
      "address": "1HB5XMLmzFVj8ALj6mf",
      "date": "18.03.2022  17:00",
      "value": "+ 2 ETH",
      "status": "Completed"
    },
  ];

  //History
  static const dynamic TRANSATION_HISTOTY_LIST = [
    {
      "address": "1FyMtiZkos6NGaroZH4v",
      "date": "23.03.2017  15:43",
      "value": "+ 0.1211234 ETH",
      "status": "Pending"
    },
    {
      "address": "1HB5XMLmzFVj8ALj6mf",
      "date": "21.03.2022  10:20",
      "value": "+ 2.3245234 ETH",
      "status": "Completed"
    },
    {
      "address": "1LYm7jrZeZaEo7rye2SN",
      "date": "20.03.2022  09:00",
      "value": "- 2.5 ETH",
      "status": "Completed"
    },
    {
      "address": "1FyMtiZkos6NGaroZH4v",
      "date": "19.03.2022  20:35 ",
      "value": "- 4 ETH",
      "status": "Fail"
    },
    {
      "address": "1HB5XMLmzFVj8ALj6mf",
      "date": "18.03.2022  17:00",
      "value": "+ 2 ETH",
      "status": "Completed"
    },
    {
      "address": "1FyMtiZkos6NGaroZH4v",
      "date": "23.03.2017  15:43",
      "value": "+ 2.3245234 ETH",
      "status": "Completed"
    },
    {
      "address": "1HB5XMLmzFVj8ALj6mf",
      "date": "21.03.2022  10:20",
      "value": "+ 2.3245234 ETH",
      "status": "Completed"
    },
    {
      "address": "1LYm7jrZeZaEo7rye2SN",
      "date": "20.03.2022  09:00",
      "value": "- 2.5 ETH",
      "status": "Completed"
    },
    {
      "address": "1FyMtiZkos6NGaroZH4v",
      "date": "19.03.2022  20:35 ",
      "value": "- 4 ETH",
      "status": "Fail"
    },
  ];

  static const dynamic SELECT_NETWORK = [
    {
      "id": "1",
      "name": "Ethereum (ERC20)",
    },
    {
      "id": "2",
      "name": "BNB Smart Chain (BEP20)",
    },
    {
      "id": "3",
      "name": "Arbitrum One",
    },
  ];
  static const dynamic SELECT_COIN = [
    {
      "id": "1",
      "name": "ETH",
    },
    {
      "id": "2",
      "name": "BTC",
    },
  ];

  static const dynamic LOAN_TREM = [
    {
      "id": "1",
      "name": "3 Months",
    },
    {
      "id": "2",
      "name": "6 Months",
    },
    {
      "id": "3",
      "name": "12 Months",
    },
  ];

  static const dynamic SELECT_COLLATERAL = [
    {
      "id": "1",
      "name": "ETH",
    },
  ];

  static const dynamic LIST_LOAN = [
    {
      "loan_no": "3000030145",
      "value1": "11,996.927",
      "value2": "113,500.00",
      "status": "Waiting for Replay",
      "date": "27 July 2022"
    },
  ];

  static String? OTP;
  static String? OTP_ENCRYPT;
  static String? REFERENCE_KRY;
  static String? PHONE_NUMBER;
}
