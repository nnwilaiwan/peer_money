import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';

class HistoryDetailScreen extends StatefulWidget {
  static const String id = "HistoryDetailScreen";
  final String? value;
  final String? status;
  final String? address;
  final String? date;
  final void Function() onInit;

  const HistoryDetailScreen(
      {Key? key,
      required this.onInit,
      this.value,
      this.status,
      this.address,
      this.date})
      : super(key: key);

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
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
              title: const Text('Deposit Details'),
              backgroundColor: AppTextSetting.COLOR_PRIMARY,
            ),
            body: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        const Text(
                          'Amount',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: AppTextSetting.APP_FONT,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF767676)),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '0.1211234',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTextSetting.APP_FONT,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 74,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE6FFF0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0) //
                                    ),
                          ),
                          child: const Text(
                            'Completed',
                            style: TextStyle(
                                fontFamily: AppTextSetting.APP_FONT,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF34A156)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Confirmations',
                              style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF767676)),
                            ),
                            Text(
                              '12 /12',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'Ethereum (ERC20)',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Address',
                              style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF767676)),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  '0xcbf53666ddd2361ad1 tgtvdd556s',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: AppTextSetting.APP_FONT,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF363636)),
                                ),
                                const SizedBox(width: 5),
                                Image.asset('assets/icons/icon-copy.png')
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Txid',
                              style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF767676)),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Internal transfer 111009899',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: AppTextSetting.APP_FONT,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF363636)),
                                ),
                                const SizedBox(width: 5),
                                Image.asset('assets/icons/icon-copy.png')
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Date',
                              style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF767676)),
                            ),
                            Text(
                              '23.03.2017  15:43',
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
          );
        });
  }
}
