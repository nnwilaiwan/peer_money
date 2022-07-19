import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:peer_money/controllers/apiController.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/models/urlApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:peer_money/testCode/sendOTPScreen.dart';
import 'package:encrypt/encrypt.dart';

class TestConnectController {
  Future<dynamic> registerPhoneNumber(
      BuildContext context, String phoneNumber) async {
    var list;

    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer d7fc83b3eb2c83c86a0bd7fcf462a48618acfe4c4dc50c1e53458d20ca1b7ec680f45dde82ff4d132a637d25847a544b889194d7ec7413abcb5273badb9a0f7e',
    };
    var request = http.Request(
        'POST', Uri.parse('${UrlApi.IP_ADDRESS}v1/auth/register/phone-number'));
    request.body = json.encode({"phone_number": phoneNumber});
    request.headers.addAll(headers);
    http.Response res = await http.Response.fromStream(await request.send());

    if (res.statusCode == 200) {
      var result = jsonDecode(res.body);
      list = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("reference", result['data']['reference']);
      await prefs.setString("otp", result['data']['otp']);
      var otp = result['data']['otp'];
      var reference = result['data']['reference'];
      AppTextSetting.OTP = result['data']['otp'];
      AppTextSetting.REFERENCE_KRY = result['data']['reference'];
      AppTextSetting.PHONE_NUMBER = phoneNumber;
      print(AppTextSetting.OTP);
      print(AppTextSetting.REFERENCE_KRY);
      print(AppTextSetting.PHONE_NUMBER);
      print(result);
      if (result['data']['otp'] != null) {
        
        final plainText = result['data']['otp'];

        
      
        /* var headers = {
          'accept': 'application/json',
          'Authorization':
              'Bearer d7fc83b3eb2c83c86a0bd7fcf462a48618acfe4c4dc50c1e53458d20ca1b7ec680f45dde82ff4d132a637d25847a544b889194d7ec7413abcb5273badb9a0f7e'
        };
        var request = http.Request(
            'GET',
            Uri.parse(
                '${UrlApi.IP_ADDRESS}v1/auth/encrypt?text=${result['data']['reference']}'));
        request.body = json.encode({"text": result['data']['otp'].toString()});

        request.headers.addAll(headers);
        http.Response res =
            await http.Response.fromStream(await request.send());

        if (res.statusCode == 200) {
          var result = jsonDecode(res.body);
          AppTextSetting.OTP_ENCRYPT = result['result'];
          print(result);
        } else {
          print(jsonDecode(res.body));
        }*/

        /*var headers = {
          'accept': 'application/json',
          'Authorization':
              'Bearer d7fc83b3eb2c83c86a0bd7fcf462a48618acfe4c4dc50c1e53458d20ca1b7ec680f45dde82ff4d132a637d25847a544b889194d7ec7413abcb5273badb9a0f7e'
        };
        var request = http.Request(
            'GET',
            Uri.parse(
                'https://dev-api-peer.assuretechnology.io/v1/auth/encrypt?text=${result['data']['otp']}'));

        request.headers.addAll(headers);
        http.Response res =
            await http.Response.fromStream(await request.send());

        if (res.statusCode == 200) {
          var result = jsonDecode(res.body);
          AppTextSetting.OTP_ENCRYPT = result['result'];
          print(result);
        } else {
          print(result);
        }*/
      }
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SendOTPScreen(
                  onInit: () {
                    StoreProvider.of<AppState>(context)
                        .dispatch(getLoginAction);
                  },
                )),
      );
    } else {
      list = false;
      print('statusCode =======> : ' + res.statusCode.toString());
      print(jsonDecode(res.body));
    }

    return list;
  }
}
