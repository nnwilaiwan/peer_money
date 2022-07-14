import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gallery_saver/files.dart';
import 'package:peer_money/controllers/sendOTPControllet.dart';
import 'package:peer_money/controllers/testConnectApiController.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:http/http.dart' as http;
import 'package:peer_money/models/urlApi.dart';

class SendOTPScreen extends StatefulWidget {
  final void Function() onInit;
  const SendOTPScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<SendOTPScreen> createState() => _SendOTPScreenState();
}

class _SendOTPScreenState extends State<SendOTPScreen> {
  final txtOTP = TextEditingController();
  String? otp_encode;
  SendOTPController sendOTP = SendOTPController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTextSetting.COLOR_PRIMARY,
        title: const Text('OTP'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        height: heightScreen,
        width: widthScreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text('Send OTP'),
            const SizedBox(height: 20),
            Text('phone number : ${AppTextSetting.PHONE_NUMBER.toString()}'),
            Text('reference : ${AppTextSetting.REFERENCE_KRY.toString()}'),
            Text('OTP : ${AppTextSetting.OTP.toString()}'),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                sendOTP.sendOTP(
                    context,
                    AppTextSetting.PHONE_NUMBER.toString(),
                    AppTextSetting.REFERENCE_KRY.toString(),
                    AppTextSetting.OTP_ENCRYPT.toString());
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: widthScreen,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTextSetting.COLOR_PRIMARY,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Send',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppTextSetting.APP_FONT,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
