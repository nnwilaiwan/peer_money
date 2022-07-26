import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';

class LoanDetailScreen extends StatefulWidget {
  static const String id = "LoanDetailScreen";
  final void Function() onInit;

  const LoanDetailScreen({
    Key? key,
    required this.onInit,
  }) : super(key: key);

  @override
  State<LoanDetailScreen> createState() => _LoanDetailScreenState();
}

class _LoanDetailScreenState extends State<LoanDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget dataloan(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF767676),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
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
                'Loan Detail',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: AppTextSetting.COLOR_PRIMARY,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        const Text(
                          'Total Loan Amount',
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
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        dataloan('Loan No.', '3000030145'),
                        const SizedBox(height: 15),
                        dataloan('Active Date', '27 Mar 2022'),
                        const SizedBox(height: 15),
                        dataloan('End Date', '27 Mar 2023'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
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
                                '5.36 ETH',
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Term Length',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '12 Months',
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  SizedBox(height: 10),
                                  Text(
                                    '111,996.927 THB',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF363636)),
                                  ),
                                  Text(
                                    'Total loan and Interest',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Interest Rate',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '12.00 %',
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Monthly Interests',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '999.744 THB',
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
                                    'Total Replay Per Month',
                                    style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF767676)),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '11,996.927 THB',
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
                          'Transactions',
                          style: TextStyle(
                              fontFamily: AppTextSetting.APP_FONT,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF767676)),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Empty',
                              style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFD6D6D6)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {},
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
                          'Repay 1/12',
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }
}
