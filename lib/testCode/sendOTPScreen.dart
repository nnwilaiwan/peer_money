import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:peer_money/controllers/sendOTPControllet.dart';
import 'package:peer_money/controllers/testConnectApiController.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:http/http.dart' as http;
import 'package:peer_money/models/urlApi.dart';
import 'package:encryptor/encryptor.dart';
import 'package:peer_money/testCode/testencryp.dart';

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
  String aes_secret =
      '9a9eb89b5ed9388720a8d23b328e79244b0b809a07f1829c22744ed2fde883be';
  String code =
      'U2FsdGVkX1+63k+ATpRwj/tGGbvRxveNzikBO2FvyrI=7';
  encrypOTP() {
    var plainText = 'SOME DATA TO ENCRYPT';
    var key = aes_secret;

    var encrypted = Encryptor.encrypt(key, plainText);
    var decrypted = Encryptor.decrypt(key, encrypted);
    print(key);
    print(plainText);

    // print(encrypted);
    // print(decrypted);
  }

  Future<String> decryptInfo(String data) async {
    var encodedKey = aes_secret;
    var decoded = base64.decode(data);
    // var decoded = Base64Decoder(data);
    var payload = json.decode(String.fromCharCodes(decoded));
    String encodedIv = payload["iv"] ?? "";
    String value = payload["value"] ?? "";

    final key1 = enc.Key.fromBase64(encodedKey);
    final iv = enc.IV.fromBase64(encodedIv);
    final encrypter = enc.Encrypter(enc.AES(key1, mode: enc.AESMode.cbc));
    final decrypted =
        encrypter.decrypt(enc.Encrypted.fromBase64(value), iv: iv);
    print(decrypted);
    return decrypted;
  }

  @override
  void initState() {
    // var plainText = AppTextSetting.OTP.toString();
    // var key = aes_secret;

    // var encrypted = Encryptor.encrypt(key, plainText);
    // var decrypted = Encryptor.decrypt(key, encrypted);
    // // final encrypter = enc.Encrypter(enc.AES(key1, mode: enc.AESMode.cbc));

    // String encoded =
    //     base64.encode(utf8.encode(encrypted)); // dXNlcm5hbWU6cGFzc3dvcmQ=

    // print('==========');
    // print(encoded);
    // print(encrypted);
    // print(decrypted);
    // print('==========');

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
                decryptInfo(AppTextSetting.OTP.toString());
                // sendOTP.sendOTP(
                //     context,
                //     AppTextSetting.PHONE_NUMBER.toString(),
                //     AppTextSetting.REFERENCE_KRY.toString(),
                //     AppTextSetting.OTP_ENCRYPT.toString());
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    MyEncryptionDecryption().encryp('12345');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 150,
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
                        'encryp',
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
                InkWell(
                  onTap: () {
                    // MyEncryptionDecryption().decryp('12345');
                    print(code.length);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 150,
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
                        'decryp',
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
            )
          ],
        ),
      ),
    );
  }
}
