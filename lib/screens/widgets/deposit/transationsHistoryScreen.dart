import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/widgets/deposit/historyDetailScreen.dart';
import 'package:peer_money/screens/widgets/withdraw/historyWithdrawDetails.dart';

class TransationsHistoryScreen extends StatefulWidget {
  static const String id = "TransationsHistoryScreen";
  final void Function() onInit;
  const TransationsHistoryScreen({Key? key, required this.onInit})
      : super(key: key);

  @override
  State<TransationsHistoryScreen> createState() =>
      _TransationsHistoryScreenState();
}

class _TransationsHistoryScreenState extends State<TransationsHistoryScreen> {
  String? dropdownValueAll;
  String? dropdownValueDeposit;
  String? dropdownValueWithdraw;
  String? _selectedValue;

  List<Widget> listAll(BuildContext context, double heightScreen,
      double widthScreen, dynamic item) {
    List<Widget> card = [];
    for (int i = 0; i < item.length; i++) {
      card.add(InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HistoryDetailScreen(
                      onInit: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(getLoginAction);
                      },
                    )),
          );
        },
        child: Container(
            alignment: Alignment.center,
            height: 95,
            // color: Colors.red,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  // margin: const EdgeInsets.only(top:5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      item[i]['address'].toString(),
                                      style: const TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF585F6F)),
                                    ),
                                    Text(
                                      item[i]['date'].toString(),
                                      style: const TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFA6B1C6)),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      width: 74,
                                      height: 28,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: item[i]['status'].toString() ==
                                                'Pending'
                                            ? const Color(0xFFFFF8DD)
                                            : item[i]['status'].toString() ==
                                                    'Completed'
                                                ? const Color(0xFFE6FFF0)
                                                : const Color(0xFFFFDFDD),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0) //
                                            ),
                                      ),
                                      child: Text(
                                        item[i]['status'].toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: item[i]['status'].toString() ==
                                                  'Pending'
                                              ? const Color(0xFFF2A21E)
                                              : item[i]['status'].toString() ==
                                                      'Completed'
                                                  ? const Color(0xFF34A156)
                                                  : const Color(0xFFD82730),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                item[i]['value'],
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: item[i]['value']
                                              .split(' ')[0]
                                              .toString() ==
                                          '+'
                                      ? AppTextSetting.COLOR_GREEN
                                      : const Color(0xFFF03D46),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFF5F5F5),
                )
              ],
            )),
      ));
    }
    return card;
  }

  List<Widget> listDeposit(BuildContext context, double heightScreen,
      double widthScreen, dynamic item) {
    List<Widget> card = [];
    for (int i = 0; i < item.length; i++) {
      card.add(InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HistoryWithdrawDetailScreen(
                      onInit: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(getLoginAction);
                      },
                    )),
          );
        },
        child: Container(
            alignment: Alignment.center,
            height: 95,
            // color: Colors.red,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  // margin: const EdgeInsets.only(top:5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      item[i]['address'].toString(),
                                      style: const TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF585F6F)),
                                    ),
                                    Text(
                                      item[i]['date'].toString(),
                                      style: const TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFA6B1C6)),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      width: 74,
                                      height: 28,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: item[i]['status'].toString() ==
                                                'Pending'
                                            ? const Color(0xFFFFF8DD)
                                            : item[i]['status'].toString() ==
                                                    'Completed'
                                                ? const Color(0xFFE6FFF0)
                                                : const Color(0xFFFFDFDD),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0) //
                                            ),
                                      ),
                                      child: Text(
                                        item[i]['status'].toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: item[i]['status'].toString() ==
                                                  'Pending'
                                              ? const Color(0xFFF2A21E)
                                              : item[i]['status'].toString() ==
                                                      'Completed'
                                                  ? const Color(0xFF34A156)
                                                  : const Color(0xFFD82730),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                item[i]['value'],
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: item[i]['value']
                                              .split(' ')[0]
                                              .toString() ==
                                          '+'
                                      ? AppTextSetting.COLOR_GREEN
                                      : const Color(0xFFF03D46),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFF5F5F5),
                )
              ],
            )),
      ));
    }
    return card;
  }

  List<Widget> listWithdraw(BuildContext context, double heightScreen,
      double widthScreen, dynamic item) {
    List<Widget> card = [];
    for (int i = 0; i < item.length; i++) {
      card.add(InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HistoryWithdrawDetailScreen(
                      onInit: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(getLoginAction);
                      },
                    )),
          );
        },
        child: Container(
            alignment: Alignment.center,
            height: 95,
            // color: Colors.red,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  // margin: const EdgeInsets.only(top:5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      item[i]['address'].toString(),
                                      style: const TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF585F6F)),
                                    ),
                                    Text(
                                      item[i]['date'].toString(),
                                      style: const TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFA6B1C6)),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      width: 74,
                                      height: 28,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: item[i]['status'].toString() ==
                                                'Pending'
                                            ? const Color(0xFFFFF8DD)
                                            : item[i]['status'].toString() ==
                                                    'Completed'
                                                ? const Color(0xFFE6FFF0)
                                                : const Color(0xFFFFDFDD),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0) //
                                            ),
                                      ),
                                      child: Text(
                                        item[i]['status'].toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: item[i]['status'].toString() ==
                                                  'Pending'
                                              ? const Color(0xFFF2A21E)
                                              : item[i]['status'].toString() ==
                                                      'Completed'
                                                  ? const Color(0xFF34A156)
                                                  : const Color(0xFFD82730),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                item[i]['value'],
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: item[i]['value']
                                              .split(' ')[0]
                                              .toString() ==
                                          '+'
                                      ? AppTextSetting.COLOR_GREEN
                                      : const Color(0xFFF03D46),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFF5F5F5),
                )
              ],
            )),
      ));
    }
    return card;
  }

  Widget _tabSection(
      BuildContext context, double heightScreen, double widthScreen) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TabBar(
              tabs: [
                Tab(text: "All"),
                Tab(text: "Deposit"),
                Tab(text: "Withdraw"),
              ],
              indicatorColor: AppTextSetting.COLOR_PRIMARY,
              labelColor: AppTextSetting.COLOR_PRIMARY,
              labelStyle: TextStyle(
                fontFamily: AppTextSetting.APP_FONT,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTextSetting.COLOR_PRIMARY,
              ),
              unselectedLabelColor: Color(0xFF767676),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(5),
                height: heightScreen,
                width: widthScreen,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: widthScreen,
                          height: 45,
                          color: const Color(0xFFF5F5F5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 150,
                                child: const Text(
                                  'TxID',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF767676),
                                      fontFamily: AppTextSetting.APP_FONT,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 150,
                                child: const Text(
                                  'Amount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF767676),
                                      fontFamily: AppTextSetting.APP_FONT,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: heightScreen,
                          child: SingleChildScrollView(
                            child: Column(
                              children: listAll(
                                  context,
                                  heightScreen,
                                  widthScreen,
                                  AppTextSetting.TRANSATION_HISTOTY_LIST),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: widthScreen,
                          height: 45,
                          color: const Color(0xFFF5F5F5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 150,
                                child: const Text(
                                  'TxID',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF767676),
                                      fontFamily: AppTextSetting.APP_FONT,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 150,
                                child: const Text(
                                  'Amount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF767676),
                                      fontFamily: AppTextSetting.APP_FONT,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: heightScreen,
                          child: SingleChildScrollView(
                            child: Column(
                              children: listDeposit(
                                  context,
                                  heightScreen,
                                  widthScreen,
                                  AppTextSetting.TRANSATION_HISTOTY_LIST),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: widthScreen,
                            height: 45,
                            color: const Color(0xFFF5F5F5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  child: const Text(
                                    'TxID',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF767676),
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  child: const Text(
                                    'Amount',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF767676),
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: heightScreen,
                            child: SingleChildScrollView(
                              child: Column(
                                children: listWithdraw(
                                    context,
                                    heightScreen,
                                    widthScreen,
                                    AppTextSetting.TRANSATION_HISTOTY_LIST),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const Text("Deposit"),
                    // const Text("User Body"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container allHistory(double widthScreen, double heightScreen) {
    return Container(
      width: widthScreen,
      height: heightScreen,
      // alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthScreen,
              height: 45,
              color: const Color(0xFFF5F5F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    child: const Text(
                      'TxID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF767676),
                          fontFamily: AppTextSetting.APP_FONT,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    child: const Text(
                      'Amount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF767676),
                          fontFamily: AppTextSetting.APP_FONT,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            dropdownAll(widthScreen, heightScreen),
            // dropdownCoin(dropdownValueAll),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: heightScreen,
              child: SingleChildScrollView(
                child: Column(
                  children: listAll(context, heightScreen, widthScreen,
                      AppTextSetting.TRANSATION_HISTOTY_LIST),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container depositHistory(double widthScreen, double heightScreen) {
    return Container(
      width: widthScreen,
      height: heightScreen,
      // alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthScreen,
              height: 45,
              color: const Color(0xFFF5F5F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    child: const Text(
                      'TxID All',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF767676),
                          fontFamily: AppTextSetting.APP_FONT,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    child: const Text(
                      'Amount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF767676),
                          fontFamily: AppTextSetting.APP_FONT,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            dropdownDeposit(widthScreen, heightScreen),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: heightScreen,
              child: SingleChildScrollView(
                child: Column(
                  children: listDeposit(context, heightScreen, widthScreen,
                      AppTextSetting.TRANSATION_HISTOTY_LIST),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container withdrawHistory(double widthScreen, double heightScreen) {
    return Container(
      width: widthScreen,
      height: heightScreen,
      // alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthScreen,
              height: 45,
              color: const Color(0xFFF5F5F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    child: const Text(
                      'TxID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF767676),
                          fontFamily: AppTextSetting.APP_FONT,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    child: const Text(
                      'Amount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF767676),
                          fontFamily: AppTextSetting.APP_FONT,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            dropdownWithdraw(widthScreen, heightScreen),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: heightScreen,
              child: SingleChildScrollView(
                child: Column(
                  children: listWithdraw(context, heightScreen, widthScreen,
                      AppTextSetting.TRANSATION_HISTOTY_LIST),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container dropdownAll(double widthScreen, double heightScreen) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const ImageIcon(
            AssetImage("assets/icons/arrow_downward.png"),
            color: AppTextSetting.COLOR_PRIMARY,
            size: 24,
          ),
          style: const TextStyle(color: AppTextSetting.COLOR_PRIMARY),
          items: [
            for (var item in AppTextSetting.SELECT_COIN) item,
          ].map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item['name'].toString(),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // width: widthScreen * 0.8,
                            // height: widthScreen * 0.08,
                            padding: const EdgeInsets.all(2),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Center(
                                child: Text(item['name'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppTextSetting.COLOR_PRIMARY,
                                        fontSize: 16,
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              dropdownValueAll = value.toString();
            });
            print('----- value ------');
            print(dropdownValueAll);
          },
          hint: const Text(
            "Select",
            style: TextStyle(
              fontFamily: AppTextSetting.APP_FONT,
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          value: dropdownValueAll,
        ),
      ),
    );
  }

  Container dropdownDeposit(double widthScreen, double heightScreen) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const ImageIcon(
            AssetImage("assets/icons/arrow_downward.png"),
            color: AppTextSetting.COLOR_PRIMARY,
            size: 24,
          ),
          style: const TextStyle(color: AppTextSetting.COLOR_PRIMARY),
          items: [
            for (var item in AppTextSetting.SELECT_COIN) item,
          ].map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item['name'].toString(),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // width: widthScreen * 0.8,
                            // height: widthScreen * 0.08,
                            padding: const EdgeInsets.all(2),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Center(
                                child: Text(item['name'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppTextSetting.COLOR_PRIMARY,
                                        fontSize: 16,
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              dropdownValueDeposit = value.toString();
            });
            print('----- value ------');
            print(dropdownValueDeposit);
          },
          hint: const Text(
            "Select",
            style: TextStyle(
              fontFamily: AppTextSetting.APP_FONT,
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          value: dropdownValueDeposit,
        ),
      ),
    );
  }

  Container dropdownWithdraw(double widthScreen, double heightScreen) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const ImageIcon(
            AssetImage("assets/icons/arrow_downward.png"),
            color: AppTextSetting.COLOR_PRIMARY,
            size: 24,
          ),
          style: const TextStyle(color: AppTextSetting.COLOR_PRIMARY),
          items: [
            for (var item in AppTextSetting.SELECT_COIN) item,
          ].map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item['name'].toString(),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // width: widthScreen * 0.8,
                            // height: widthScreen * 0.08,
                            padding: const EdgeInsets.all(2),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Center(
                                child: Text(item['name'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppTextSetting.COLOR_PRIMARY,
                                        fontSize: 16,
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              dropdownValueWithdraw = value.toString();
            });
            print('----- value ------');
            print(dropdownValueWithdraw);
          },
          hint: const Text(
            "Select",
            style: TextStyle(
              fontFamily: AppTextSetting.APP_FONT,
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          value: dropdownValueWithdraw,
        ),
      ),
    );
  }

  @override
  void initState() {
    dropdownValueAll = 'ETH';
    dropdownValueDeposit = 'BTC';
    dropdownValueWithdraw = 'ETH';
    super.initState();
    widget.onInit;
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
                  'Transations History',
                  style: TextStyle(
                    fontFamily: AppTextSetting.APP_FONT,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                backgroundColor: AppTextSetting.COLOR_PRIMARY,
              ),
              body: Container(
                height: heightScreen * 0.98,
                width: widthScreen * 1.0,
                //color: Colors.green,
                child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        title: TabBar(
                          onTap: (index) {
                            // print(index);
                          },
                          tabs: const [
                            Tab(text: "All"),
                            Tab(text: "Deposit"),
                            Tab(text: "Withdraw"),
                          ],
                          indicatorColor: AppTextSetting.COLOR_PRIMARY,
                          labelColor: AppTextSetting.COLOR_PRIMARY,
                          unselectedLabelColor: const Color(0xFF767676),
                          labelStyle: const TextStyle(
                            fontFamily: AppTextSetting.APP_FONT,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppTextSetting.COLOR_PRIMARY,
                          ),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      body: Container(
                        color: Colors.white,
                        child: TabBarView(
                          children: [
                            allHistory(widthScreen, heightScreen),
                            depositHistory(widthScreen, heightScreen),
                            withdrawHistory(widthScreen, heightScreen)
                          ],
                        ),
                      ),
                    )),
              )
              /* body: DefaultTabController(
              length: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                    onTap: (index) {
                      print(index);
                    },
                    tabs: list,
                    indicatorColor: AppTextSetting.COLOR_PRIMARY,
                    labelColor: AppTextSetting.COLOR_PRIMARY,
                    // labelStyle: TextStyle(
                    //   fontFamily: AppTextSetting.APP_FONT,
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.w700,
                    //   color: AppTextSetting.COLOR_PRIMARY,
                    // ),
                    unselectedLabelColor: const Color(0xFF767676),
                  ),
                  TabBarView(
                    children: [
                      allHistory(widthScreen, heightScreen),
                      depositHistory(widthScreen, heightScreen),
                      withdrawHistory(widthScreen, heightScreen)
                      
                    ],
                  ),
                ],
              ),
            ),*/

              // body: SingleChildScrollView(
              //   child: Column(
              //     // children: [ _tabSection(context, heightScreen, widthScreen),],
              //     children: [
              //       Container(
              //         height: heightScreen,
              //         // child: _tabSection(context, heightScreen, widthScreen),
              //         child: SingleChildScrollView(
              //           child: _tabSection(context, heightScreen, widthScreen),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              );
        });
  }
}
