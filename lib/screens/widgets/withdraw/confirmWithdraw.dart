import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/widgets/withdraw/verificationPinCode.dart';

class ConfirmWithdrawDetailScreen extends StatefulWidget {
  static const String id = "ConfirmWithdrawDetailScreen";
  final void Function() onInit;

  const ConfirmWithdrawDetailScreen({Key? key, required this.onInit})
      : super(key: key);

  @override
  State<ConfirmWithdrawDetailScreen> createState() =>
      _ConfirmWithdrawDetailScreenState();
}

class _ConfirmWithdrawDetailScreenState
    extends State<ConfirmWithdrawDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Confirm Withdraw',
                style: TextStyle(
                  fontFamily: AppTextSetting.APP_FONT,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: AppTextSetting.COLOR_PRIMARY,
            ),
            body: Stack(
              children: [
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          // color: Colors.red,
                          child: Column(
                            children: const [
                              Text(
                                'Amount',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF767676)),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '5.5',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Withdraw to Address',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  Text(
                                    '0xcbf53666ddd2361ad1 tgtvdd556s',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF363636)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Network',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  Text(
                                    'Ethereum (ERC20)2',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF363636)),
                                  )
                                ],
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Network fee',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  Text(
                                    '0.01 ETH',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF363636)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerificationPincodeScreen(
                                  onInit: () {
                                    StoreProvider.of<AppState>(context)
                                        .dispatch(getLoginAction);
                                  },
                                )),
                      );
                    },
                    child: Container(
                      width: 343,
                      height: 45,
                      margin: const EdgeInsets.only(bottom: 45),
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
                          'Confirm Withdraw',
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
                ),
              ],
            ),
          );
        });
  }
}
