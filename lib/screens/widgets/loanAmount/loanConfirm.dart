import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';

class LoanConfirmScreen extends StatefulWidget {
  static const String id = "LoanConfirmScreen";
  final void Function() onInit;

  const LoanConfirmScreen({
    Key? key,
    required this.onInit,
  }) : super(key: key);

  @override
  State<LoanConfirmScreen> createState() => _LoanConfirmScreenState();
}

class _LoanConfirmScreenState extends State<LoanConfirmScreen> {
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
              title: const Text('Confirm Your Loan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),),
              backgroundColor: AppTextSetting.COLOR_PRIMARY,
            ),
            body: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        const Text(
                          'Total Loan Amountount',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: AppTextSetting.APP_FONT,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF767676)),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: const Text(
                                '100,000.00',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: const Text(
                                'THB',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF363636)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '50 %',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF34A156),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'LVT',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF363636),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: const Text(
                              'Locking to loan is ',
                              style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF767676)),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/btc-assets.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    'Bitcoin',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF363636)),
                                  ),
                                ],
                              ),
                              const Text(
                                '0.145435 BTC',
                                style: TextStyle(
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF363636)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/eth-assets.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    'Ethereum',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF363636)),
                                  ),
                                ],
                              ),
                              const Text(
                                '2.72 ETH',
                                style: TextStyle(
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF363636)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    color: Colors.grey.shade100,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Total of Payments',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  Text(
                                    '113,500.00 THB',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF363636)),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Term Length',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  Text(
                                    '3 Months',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF363636)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Monthly Interest',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  Text(
                                    ' 1,500.00 THB',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF363636)),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Total Interest',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  Text(
                                    '4,500.00 THB',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF363636)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Transfer to Bank Account',
                          style: TextStyle(
                              fontFamily: AppTextSetting.APP_FONT,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF767676)),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.only(left: 5, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Bank namet',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  Text(
                                    'kasikornbank',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF363636)),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Account Number',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  Text(
                                    '6057892259',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF363636)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.only(left: 5, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Account Name',
                                style: TextStyle(
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF767676)),
                              ),
                              Text(
                                'Elon Muskeasy',
                                style: TextStyle(
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF363636)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => LoanAmountScreen(
                      //             onInit: () {
                      //               StoreProvider.of<AppState>(context)
                      //                   .dispatch(getLoginAction);
                      //             },
                      //           )),
                      // );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      width: widthScreen,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTextSetting.COLOR_PRIMARY,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Confirm',
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
                  const SizedBox(height: 15),
                ],
              ),
            ),
          );
        });
  }
}
