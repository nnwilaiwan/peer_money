import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:peer_money/models/urlApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendOTPController {
  Future<dynamic> sendOTP(BuildContext context, String phoneNumber,
      String reference, String otp) async {
    var list;

    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer d7fc83b3eb2c83c86a0bd7fcf462a48618acfe4c4dc50c1e53458d20ca1b7ec680f45dde82ff4d132a637d25847a544b889194d7ec7413abcb5273badb9a0f7e',
    };
    var request =
        http.Request('POST', Uri.parse('${UrlApi.IP_ADDRESS}v1/otp/verify'));
    request.body = json.encode({
      "phone_number": phoneNumber,
      "reference": reference,
      "otp": otp
    });
    request.headers.addAll(headers);
    http.Response res = await http.Response.fromStream(await request.send());

    var result = jsonDecode(res.body);
    if (res.statusCode == 200) {
      // var result = jsonDecode(res.body);
      list = result;
      var token = list['data']['otp_token'];
      print(token);
      print(list);
    } else {
      list = result;
      Fluttertoast.showToast(
          msg: list['status']['description'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xFF424242),
          textColor: Colors.white,
          fontSize: 13.0);

      print('statusCode =======> : ' + res.statusCode.toString());
      print(list['status']['description']);
      print(phoneNumber);
      print(reference);
      print(otp);
    }

    return list;
  }
}
