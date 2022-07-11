//import 'dart:math';
import 'dart:io';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


class BaseController {
  Future<void> beginApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', 'test');
  }

  // Future<bool> checkInternet() async {
  //   var list;
  //   await Future.delayed(const Duration(seconds: 5), () async {
  //     try {
  //       final result =
  //           await InternetAddress.lookup('subcontract.amatateam.com');
  //       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //         print('connected');
  //         list = true;
  //       }
  //     } on SocketException catch (e) {
  //       print('not connected : $e');
  //       list = false;
  //     }
  //   });

  //   return list;
  // }

  bool checkDigit(String id) {
    var result;

    if (id.length == 13) {
      var sum = (int.parse(id.substring(0, 1)) * 13) +
          (int.parse(id.substring(1, 2)) * 12) +
          (int.parse(id.substring(2, 3)) * 11) +
          (int.parse(id.substring(3, 4)) * 10) +
          (int.parse(id.substring(4, 5)) * 9) +
          (int.parse(id.substring(5, 6)) * 8) +
          (int.parse(id.substring(6, 7)) * 7) +
          (int.parse(id.substring(7, 8)) * 6) +
          (int.parse(id.substring(8, 9)) * 5) +
          (int.parse(id.substring(9, 10)) * 4) +
          (int.parse(id.substring(10, 11)) * 3) +
          (int.parse(id.substring(11, 12)) * 2);

      var mod = sum % 11;

      var digit = (11 - mod).toString().length > 1
          ? (11 - mod).toString().substring(1, 2)
          : (11 - mod).toString();

      print(digit);

      if (id.substring(12, 13) == digit) {
        result = true;
      } else {
        result = false;
      }

      print('ditgit : ' + digit);
    } else {
      result = false;
    }

    return result;
  }

  String getDateNowThai(DateTime now) {
    var day = now.day;
    var month = now.month;
    var year = now.year + 543;

    var date =
        (day.toString().length < 2 ? '0' + day.toString() : day.toString()) +
            '/' +
            (month.toString().length < 2
                ? '0' + month.toString()
                : month.toString()) +
            '/' +
            year.toString();

    return date;
  }

  String getDateNowENG(DateTime now) {
    var day = now.day;
    var month = now.month;
    var year = now.year;

    var date =
        (day.toString().length < 2 ? '0' + day.toString() : day.toString()) +
            '/' +
            (month.toString().length < 2
                ? '0' + month.toString()
                : month.toString()) +
            '/' +
            year.toString();

    return date;
  }

  String getTimeNow(DateTime now) {
    var time;
    var h = now.hour;
    var m = now.minute;

    time = (h.toString().length < 2 ? '0' + h.toString() : h.toString()) +
        ':' +
        (m.toString().length < 2 ? '0' + m.toString() : m.toString());

    return time;
  }

  String getFullThaiDate(DateTime datetime) {
    String day, month, year;

    day = datetime.day.toString();
    month = getFullThaiMonth(datetime.month);
    year = (datetime.year + 543).toString();

    return day + ' ' + month + ' ' + year;
  }

  String getShortThaiDate(DateTime datetime) {
    String day, month, year;

    day = datetime.day.toString();
    month = getShortThaiMonthInputStyle1(datetime.month);
    year = (datetime.year + 543).toString();

    return day + ' ' + month + ' ' + year;
  }

  String getFullThaiMonthandYear(DateTime datetime) {
    String month, year;

    month = getFullThaiMonth(datetime.month);
    year = (datetime.year + 543).toString();

    return month + ' ' + year;
  }

  String getFullThaiMonth(int month) {
    switch (month) {
      case 1:
        return 'มกราคม';
      case 2:
        return 'กุมภาพันธ์';
      case 3:
        return 'มีนาคม';
      case 4:
        return 'เมษายน';
      case 5:
        return 'พฤษภาคม';
      case 6:
        return 'มิถุนายน';
      case 7:
        return 'กรกฎาคม';
      case 8:
        return 'สิงหาคม';
      case 9:
        return 'กันยายน';
      case 10:
        return 'ตุลาคม';
      case 11:
        return 'พฤศจิกายน';
      case 12:
        return 'ธันวาคม';
      default:
        return '';
    }
  }

  String getLongEngMonth(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  String getShortThaiMonthInputStyle1(int month) {
    switch (month) {
      case 1:
        return 'ม.ค.';
      case 2:
        return 'ก.พ.';
      case 3:
        return 'มี.ค.';
      case 4:
        return 'เม.ย.';
      case 5:
        return 'พ.ค.';
      case 6:
        return 'มิ.ย.';
      case 7:
        return 'ก.ค.';
      case 8:
        return 'ส.ค.';
      case 9:
        return 'ก.ย.';
      case 10:
        return 'ต.ค.';
      case 11:
        return 'พ.ย.';
      case 12:
        return 'ธ.ค.';
      default:
        return '';
    }
  }

  String getShortThaiMonthInputStyle2(int month) {
    switch (month) {
      case 01:
        return 'ม.ค.';
      case 02:
        return 'ก.พ.';
      case 03:
        return 'มี.ค.';
      case 04:
        return 'เม.ย.';
      case 05:
        return 'พ.ค.';
      case 06:
        return 'มิ.ย.';
      case 07:
        return 'ก.ค.';
      case 08:
        return 'ส.ค.';
      case 09:
        return 'ก.ย.';
      case 10:
        return 'ต.ค.';
      case 11:
        return 'พ.ย.';
      case 12:
        return 'ธ.ค.';
      default:
        return '';
    }
  }

  int getColorWeekDay(String dateTime) {
    String year = dateTime.split('/')[2].split(' ')[0];
    String month = dateTime.split('/')[1].split(' ')[0].length == 1
        ? '0' + dateTime.split('/')[1].split(' ')[0]
        : dateTime.split('/')[1].split(' ')[0];
    String day = dateTime.split('/')[0].split(' ')[0].length == 1
        ? '0' + dateTime.split('/')[0].split(' ')[0]
        : dateTime.split('/')[0].split(' ')[0];
    String time = '23';
    String minute = '59';
    String sec = '55';
    String dateformat =
        (int.parse(year) - 543).toString() + month + day + time + minute + sec;

    int result;

    String date = dateformat; //'20180626170555';
    String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
    DateTime weekDays = DateTime.parse(dateWithT);

    //result = weekDays.weekday;

    switch (weekDays.weekday) {
      case 7:
        result = 0xFFDA3939;
        break;
      case 1:
        result = 0xFFE5DB08;
        break;
      case 2:
        result = 0xFFE5089E;
        break;
      case 3:
        result = 0xFF0EC813;
        break;
      case 4:
        result = 0xFFF9AC08;
        break;
      case 5:
        result = 0xFF08A3F9;
        break;
      case 6:
        result = 0xFF9D56EB;
        break;

      default:
        result = 0xFFDA3939;
        break;
    }

    return result;
  }

  String getThaiWeekDay(String dateTime) {
    String year = dateTime.split('/')[2].split(' ')[0];
    String month = dateTime.split('/')[1].split(' ')[0].length == 1
        ? '0' + dateTime.split('/')[1].split(' ')[0]
        : dateTime.split('/')[1].split(' ')[0];
    String day = dateTime.split('/')[0].split(' ')[0].length == 1
        ? '0' + dateTime.split('/')[0].split(' ')[0]
        : dateTime.split('/')[0].split(' ')[0];
    String time = '23';
    String minute = '59';
    String sec = '55';
    String dateformat =
        (int.parse(year) - 543).toString() + month + day + time + minute + sec;

    String result = '';

    String date = dateformat; //'20180626170555';
    String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
    DateTime weekDays = DateTime.parse(dateWithT);

    result = weekDays.weekday.toString();

    switch (int.parse(weekDays.weekday.toString())) {
      case 7:
        result = 'อาทิตย์';
        break;
      case 1:
        result = 'จันทร์';
        break;
      case 2:
        result = 'อังคาร';
        break;
      case 3:
        result = 'พุธ';
        break;
      case 4:
        result = 'พฤหัสบดี';
        break;
      case 5:
        result = 'ศุกร์';
        break;
      case 6:
        result = 'เสาร์';
        break;

      default:
        result = 'อาทิตย์';
        break;
    }

    return result;
  }

  String getEngWeekDay(String dateTime) {
    String year = dateTime.split('/')[2].split(' ')[0];
    String month = dateTime.split('/')[1].split(' ')[0].length == 1
        ? '0' + dateTime.split('/')[1].split(' ')[0]
        : dateTime.split('/')[1].split(' ')[0];
    String day = dateTime.split('/')[0].split(' ')[0].length == 1
        ? '0' + dateTime.split('/')[0].split(' ')[0]
        : dateTime.split('/')[0].split(' ')[0];
    String time = '23';
    String minute = '59';
    String sec = '55';
    String dateformat =
        (int.parse(year) - 543).toString() + month + day + time + minute + sec;

    String result = '';

    //result = dateTime.toString();

    String date = dateformat; //'20180626170555';
    String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
    DateTime weekDays = DateTime.parse(dateWithT);

    result = weekDays.weekday.toString();

    print(weekDays.toString());

    switch (int.parse(weekDays.weekday.toString())) {
      case 7:
        result = 'Sunday';
        break;
      case 1:
        result = 'Monday';
        break;
      case 2:
        result = 'Tuesday';
        break;
      case 3:
        result = 'Wednesday';
        break;
      case 4:
        result = 'Thursday';
        break;
      case 5:
        result = 'Friday';
        break;
      case 6:
        result = 'Saturday';
        break;

      default:
        result = 'Sunday';
        break;
    }

    return result;
  }

  String getFullThaiWeekDay(int day, bool refSAU) {
    if (refSAU == false) {
      if (day == 7) day = 0;
      day += 1;
    }
    switch (day) {
      case 1:
        return 'อาทิตย์';
      case 2:
        return 'จันทร์';
      case 3:
        return 'อังคาร';
      case 4:
        return 'พุธ';
      case 5:
        return 'พฤหัสบดี';
      case 6:
        return 'ศุกร์';
      case 7:
        return 'เสาร์';
      default:
        return 'อาทิตย์';
    }
  }

  String getShortThaiWeekDay(int day, bool refSAU) {
    if (refSAU == false) {
      if (day == 7) day = 0;
      day += 1;
    }

    if (day != 99) {
      switch (day) {
        case 1:
          return 'อา.';
        case 2:
          return 'จ.';
        case 3:
          return 'อ.';
        case 4:
          return 'พ.';
        case 5:
          return 'พฤ.';
        case 6:
          return 'ศ.';
        case 7:
          return 'ส.';
        default:
          return 'อา.';
      }
    } else {
      return '';
    }
  }

  int getABSNumber(int number) {
    if (number < 0) number *= -1;
    return number;
  }

  int getTimeDiff(DateTime start, DateTime end) {
    int diff = 0;
    diff = end.difference(start).inMinutes;
    if (end.isBefore(start)) diff = start.difference(end).inMinutes;
    return diff;
  }


  String getShortString(String str, int length) {
    if (str.length > length) {
      return str.substring(0, length) + '...';
    }
    return str;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    //return double.parse(s, (e) => null) != null;
    return double.tryParse(s) != null;
  }

  // String qrCodeTMB(BuildContext context, String money) {
  //   var datetime = dateTimeNowForTMB(context);

  //   int dataLength30 =
  //       "0016A00000067701011201150107537000017160217ABCD20180316999990310M001002003"
  //           .length;
  //   int dataLengthRef1 = "ABCD2018031699999".length;
  //   int dataLengthRef2 = "M001002003".length;
  //   int dataLengthMoney = money.length;
  //   int dataLength59 = "AMATATEAM".length;
  //   int dataLength62 =
  //       "0720".length + "DXXXE".length + datetime.length + "ZZZZZ".length;

  //   var data = "000201" + //fix
  //       "010212" + //fix
  //       "30" +
  //       (dataLength30.toString().length < 2
  //           ? "0" + dataLength30.toString()
  //           : dataLength30.toString()) + //data30
  //       "0016A000000677010112" + //fix
  //       "0115010753700001716" + //ธนาคาร ***fix
  //       "02" +
  //       (dataLengthRef1.toString().length < 2
  //           ? "0" + dataLengthRef1.toString()
  //           : dataLengthRef1.toString()) +
  //       "ABCD2018031699999" + //ref1
  //       "03" +
  //       (dataLengthRef2.toString().length < 2
  //           ? "0" + dataLengthRef2.toString()
  //           : dataLengthRef2.toString()) +
  //       "M001002003" + //ref2
  //       "5303764" + //fix
  //       "54" +
  //       (dataLengthMoney.toString().length < 2
  //           ? "0" + dataLengthMoney.toString()
  //           : dataLengthMoney.toString()) +
  //       money + //money
  //       "5802TH" + // fix
  //       "59" +
  //       (dataLength59.toString().length < 2
  //           ? "0" + dataLength59.toString()
  //           : dataLength59.toString()) +
  //       "AMATATEAM" +
  //       "62" +
  //       (dataLength62.toString().length < 2
  //           ? "0" + dataLength62.toString()
  //           : dataLength62.toString()) +
  //       "0720" +
  //       "DXXXE" +
  //       datetime +
  //       "ZZZZZ" +
  //       "6304";

  //   var hex = crc16HexDigest(data);
  //   //print(hex.toUpperCase());

  //   var qr = data + hex.toUpperCase(); //hexadecimal(data.length); 60361
  //   print(qr);

  //   return qr;
  // }

  String dateTimeNowForTMB(BuildContext context) {
    DateTime now = new DateTime.now();

    var h = now.hour;
    var m = now.minute;
    var day = now.day + 1;
    var month = now.month;
    var year = now.year + 543;

    if (now.month + 1 > lengthMonth(now.month)) {
      if (month + 1 > 12) {
        month = 1;
      } else {
        month = month + 1;
      }

      day = 1;
    }

    String datetime =
        (day.toString().length < 2 ? "0" + day.toString() : day.toString()) +
            (month.toString().length < 2
                ? "0" + month.toString()
                : month.toString()) +
            (year.toString()).substring(2) +
            (h.toString().length < 2 ? "0" + h.toString() : h.toString()) +
            (m.toString().length < 2
                ? "0" + m.toString()
                : m.toString()); //print(now);

    print(datetime);
    return datetime;
  }

  int lengthMonth(int m) {
    switch (m) {
      case 1:
        return 31;
        break;
      case 2:
        if ((DateTime.now().year % 2) == 0) {
          return 28;
        } else {
          return 29;
        }
        break;
      case 3:
        return 31;
        break;
      case 4:
        return 30;
        break;
      case 5:
        return 31;
        break;
      case 6:
        return 30;
        break;
      case 7:
        return 31;
        break;
      case 8:
        return 31;
        break;
      case 9:
        return 30;
        break;
      case 10:
        return 31;
        break;
      case 11:
        return 30;
        break;
      case 12:
        return 31;
        break;

      default:
        return 0;
        break;
    }
  }

  String hexadecimal(int num10) {
    int number = num10, base = 16;
    String basedNumber = "";
    int iRemainder;
    String cRemainder = "";
    do {
      iRemainder = number % base;
      if (iRemainder >= 10) {
        switch (iRemainder) {
          case 10:
            cRemainder = 'A';
            break;
          case 11:
            cRemainder = 'B';
            break;
          case 12:
            cRemainder = 'C';
            break;
          case 13:
            cRemainder = 'D';
            break;
          case 14:
            cRemainder = 'E';
            break;
          case 15:
            cRemainder = 'F';
            break;
        }
        basedNumber = cRemainder + basedNumber;
      } else {
        basedNumber = iRemainder.toString() + basedNumber;
      }
      number = number ~/ base;
    } while (number > 0);

    return basedNumber;
  }

  // String crc16HexDigest(String str) {
  //   return sprintf("%04x", [crc16(str)]);
  // }

  int crc16(String str) {
    List<int> crc16_Lookup = [
      0x0000,
      0x1021,
      0x2042,
      0x3063,
      0x4084,
      0x50A5,
      0x60C6,
      0x70E7,
      0x8108,
      0x9129,
      0xA14A,
      0xB16B,
      0xC18C,
      0xD1AD,
      0xE1CE,
      0xF1EF,
      0x1231,
      0x0210,
      0x3273,
      0x2252,
      0x52B5,
      0x4294,
      0x72F7,
      0x62D6,
      0x9339,
      0x8318,
      0xB37B,
      0xA35A,
      0xD3BD,
      0xC39C,
      0xF3FF,
      0xE3DE,
      0x2462,
      0x3443,
      0x0420,
      0x1401,
      0x64E6,
      0x74C7,
      0x44A4,
      0x5485,
      0xA56A,
      0xB54B,
      0x8528,
      0x9509,
      0xE5EE,
      0xF5CF,
      0xC5AC,
      0xD58D,
      0x3653,
      0x2672,
      0x1611,
      0x0630,
      0x76D7,
      0x66F6,
      0x5695,
      0x46B4,
      0xB75B,
      0xA77A,
      0x9719,
      0x8738,
      0xF7DF,
      0xE7FE,
      0xD79D,
      0xC7BC,
      0x48C4,
      0x58E5,
      0x6886,
      0x78A7,
      0x0840,
      0x1861,
      0x2802,
      0x3823,
      0xC9CC,
      0xD9ED,
      0xE98E,
      0xF9AF,
      0x8948,
      0x9969,
      0xA90A,
      0xB92B,
      0x5AF5,
      0x4AD4,
      0x7AB7,
      0x6A96,
      0x1A71,
      0x0A50,
      0x3A33,
      0x2A12,
      0xDBFD,
      0xCBDC,
      0xFBBF,
      0xEB9E,
      0x9B79,
      0x8B58,
      0xBB3B,
      0xAB1A,
      0x6CA6,
      0x7C87,
      0x4CE4,
      0x5CC5,
      0x2C22,
      0x3C03,
      0x0C60,
      0x1C41,
      0xEDAE,
      0xFD8F,
      0xCDEC,
      0xDDCD,
      0xAD2A,
      0xBD0B,
      0x8D68,
      0x9D49,
      0x7E97,
      0x6EB6,
      0x5ED5,
      0x4EF4,
      0x3E13,
      0x2E32,
      0x1E51,
      0x0E70,
      0xFF9F,
      0xEFBE,
      0xDFDD,
      0xCFFC,
      0xBF1B,
      0xAF3A,
      0x9F59,
      0x8F78,
      0x9188,
      0x81A9,
      0xB1CA,
      0xA1EB,
      0xD10C,
      0xC12D,
      0xF14E,
      0xE16F,
      0x1080,
      0x00A1,
      0x30C2,
      0x20E3,
      0x5004,
      0x4025,
      0x7046,
      0x6067,
      0x83B9,
      0x9398,
      0xA3FB,
      0xB3DA,
      0xC33D,
      0xD31C,
      0xE37F,
      0xF35E,
      0x02B1,
      0x1290,
      0x22F3,
      0x32D2,
      0x4235,
      0x5214,
      0x6277,
      0x7256,
      0xB5EA,
      0xA5CB,
      0x95A8,
      0x8589,
      0xF56E,
      0xE54F,
      0xD52C,
      0xC50D,
      0x34E2,
      0x24C3,
      0x14A0,
      0x0481,
      0x7466,
      0x6447,
      0x5424,
      0x4405,
      0xA7DB,
      0xB7FA,
      0x8799,
      0x97B8,
      0xE75F,
      0xF77E,
      0xC71D,
      0xD73C,
      0x26D3,
      0x36F2,
      0x0691,
      0x16B0,
      0x6657,
      0x7676,
      0x4615,
      0x5634,
      0xD94C,
      0xC96D,
      0xF90E,
      0xE92F,
      0x99C8,
      0x89E9,
      0xB98A,
      0xA9AB,
      0x5844,
      0x4865,
      0x7806,
      0x6827,
      0x18C0,
      0x08E1,
      0x3882,
      0x28A3,
      0xCB7D,
      0xDB5C,
      0xEB3F,
      0xFB1E,
      0x8BF9,
      0x9BD8,
      0xABBB,
      0xBB9A,
      0x4A75,
      0x5A54,
      0x6A37,
      0x7A16,
      0x0AF1,
      0x1AD0,
      0x2AB3,
      0x3A92,
      0xFD2E,
      0xED0F,
      0xDD6C,
      0xCD4D,
      0xBDAA,
      0xAD8B,
      0x9DE8,
      0x8DC9,
      0x7C26,
      0x6C07,
      0x5C64,
      0x4C45,
      0x3CA2,
      0x2C83,
      0x1CE0,
      0x0CC1,
      0xEF1F,
      0xFF3E,
      0xCF5D,
      0xDF7C,
      0xAF9B,
      0xBFBA,
      0x8FD9,
      0x9FF8,
      0x6E17,
      0x7E36,
      0x4E55,
      0x5E74,
      0x2E93,
      0x3EB2,
      0x0ED1,
      0x1EF0
    ];

    int crc16 = 0xFFFF; // the CRC
    int len = str.length;

    for (int i = 0; i < len; i++) {
      Uint8List my_ascii = ascii.encode(str[i]);
      int t = (crc16 >> 8) ^ my_ascii.first;

      crc16 = ((crc16 << 8) & 0xffff) ^ crc16_Lookup[t];
    }
    return crc16;
  }

  //ไปยังเล้นทาง
  // launchMapsUrl(
  //     //sourceLatitude, sourceLongitude,
  //     destinationLatitude,
  //     destinationLongitude) async {
  //   String mapOptions = [
  //     //'saddr=$sourceLatitude,$sourceLongitude',
  //     'daddr=$destinationLatitude,$destinationLongitude',
  //     'dir_action=navigate'
  //   ].join('&');

  //   final url = 'https://www.google.com/maps?$mapOptions';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  //ไปยัง
  // launchMap({String lat = "37.4219983", String long = "-122.084"}) async {
  //   var mapSchema = 'geo:$lat,$long';
  //   if (await canLaunch(mapSchema)) {
  //     await launch(mapSchema);
  //   } else {
  //     throw 'Could not launch $mapSchema';
  //   }
  // }

//นำทาง
  // navigateTo(double lat, double lng) async {
  //   var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
  //   if (await canLaunch(uri.toString())) {
  //     await launch(uri.toString());
  //   } else {
  //     throw 'Could not launch ${uri.toString()}';
  //   }
  // }

  //setTheme

  // checkTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString('themeColor') == null) {
  //     prefs.setString('themeColor', 'black');
  //     AppTextSetting.THEME_APP = "black";
  //   } else {
  //     if (prefs.getString('themeColor') == 'black') {
  //       prefs.setString('themeColor', 'black');
  //       AppTextSetting.THEME_APP = "black";
  //     } else {
  //       prefs.setString('themeColor', 'white');
  //       AppTextSetting.THEME_APP = "white";
  //     }
  //   }
  // }

  // changeTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString('themeColor') == 'black') {
  //     prefs.setString('themeColor', 'white');
  //     AppTextSetting.THEME_APP = "white";
  //   } else {
  //     prefs.setString('themeColor', 'black');
  //     AppTextSetting.THEME_APP = "black";
  //   }
  // }
}
