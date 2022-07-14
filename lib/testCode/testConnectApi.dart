import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/controllers/testConnectApiController.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/testCode/sendOTPScreen.dart';
import 'package:peer_money/testCode/testCode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestConnectApi extends StatefulWidget {
  static const String id = "TestConnectApi";
  final void Function() onInit;
  const TestConnectApi({Key? key, required this.onInit}) : super(key: key);

  @override
  State<TestConnectApi> createState() => _TestConnectApiState();
}

class _TestConnectApiState extends State<TestConnectApi> {
  final phoneNumber = TextEditingController();
  TestConnectController testConnectController = TestConnectController();
  @override
  void initState() {
    phoneNumber.text = '0812345679';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return SafeArea(
            child: Container(
              margin: const EdgeInsets.all(10),
              height: heightScreen,
              width: widthScreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Register Phone Number',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: AppTextSetting.APP_FONT,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.phone,
                    controller: phoneNumber,
                    cursorColor: const Color(0xFFD6D6D6),
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFD6D6D6),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFD6D6D6),
                          ),
                        ),
                        suffixStyle: TextStyle(color: Colors.green)),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      // AppTextSetting.APP_FONT;
                      testConnectController.registerPhoneNumber(
                          context, phoneNumber.text);
                      setState(() {
                        // if (register.toString() == 'true') {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => SendOTPScreen(
                        //             onInit: () {
                        //               StoreProvider.of<AppState>(context)
                        //                   .dispatch(getLoginAction);
                        //             },
                        //           )),
                        // );
                        // }
                      });

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => SendOTPScreen(
                      //       otp: AppTextSetting.OTP,
                      //       reference: AppTextSetting.REFERENCE_KRY,
                      //       onInit: () {
                      //         StoreProvider.of<AppState>(context)
                      //             .dispatch(getLoginAction);
                      //       },
                      //     ),
                      //   ),
                      // );
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
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
