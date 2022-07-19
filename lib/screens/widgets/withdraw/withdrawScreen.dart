import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/navigations/navigationMenuBar.dart';
import 'package:peer_money/screens/widgets/deposit/transationsHistoryScreen.dart';
import 'package:peer_money/screens/widgets/withdraw/confirmWithdraw.dart';

class WithdrawScreen extends StatefulWidget {
  static const String id = "WithdrawScreen";
  final void Function() onInit;
  final String? title;
  const WithdrawScreen({Key? key, required this.onInit, required this.title})
      : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final depositAddress = TextEditingController();
  final amountTxt = TextEditingController();

  String? _selectedValue;

  @override
  void initState() {
    depositAddress.text = 'Oxa335xerwerwjk4w2342432D52qWERz56';
    amountTxt.text = '5.5';
    super.initState();
  }

  Container dropdownNetwork(double widthScreen, double heightScreen) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(width: 1, color: Colors.grey),
          color: Colors.white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          items: [
            for (var item in AppTextSetting.SELECT_NETWORK) item,
          ].map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item['id'].toString(),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: widthScreen * 0.8,
                            height: widthScreen * 0.08,
                            padding: const EdgeInsets.all(2),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Center(
                                child: Text(item['name'],
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
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
              _selectedValue = value! as String?;
            });
            print('----- value ------');
            print(_selectedValue);
          },
          hint: const Text(
            "Select Network",
            style: TextStyle(
              fontFamily: AppTextSetting.APP_FONT,
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          value: _selectedValue,
        ),
      ),
    );
  }

  List<Widget> listDepositAll(BuildContext context, double heightScreen,
      double widthScreen, dynamic item) {
    List<Widget> card = [];
    for (int i = 0; i < item.length; i++) {
      card.add(InkWell(
        onTap: () {},
        child: Container(
            alignment: Alignment.center,
            height: 90,
            // color: Colors.red,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  // margin: const EdgeInsets.all(10),
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
          Container(
            // height: MediaQuery.of(context).size.height,
            height: 400,
            width: widthScreen,
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: widthScreen,
                        height: 45,
                        color: Color(0xFFF5F5F5),
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
                      Column(
                        children: listDepositAll(context, heightScreen,
                            widthScreen, AppTextSetting.DEPOSIT_LIST),
                      ),
                    ],
                  ),
                ),
                const Text("Deposit"),
                const Text("User Body"),
              ],
            ),
          ),
        ],
      ),
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
              title: Text(
                'Withdraw ${widget.title.toString()}',
                style: const TextStyle(
                  fontFamily: AppTextSetting.APP_FONT,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: AppTextSetting.COLOR_PRIMARY,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransationsHistoryScreen(
                                  onInit: () {
                                    StoreProvider.of<AppState>(context)
                                        .dispatch(getLoginAction);
                                  },
                                )),
                      );
                    },
                    icon: Image.asset('assets/icons/icon-clock.png'))
              ],
            ),
            body: Stack(
              children: [
                Container(
                  // color: Colors.amber,
                  height: 740,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(13),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Select Network',
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              dropdownNetwork(widthScreen, heightScreen),
                              const SizedBox(height: 10),
                              const Text(
                                'Wtihdraw to Address',
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 47,
                                margin: const EdgeInsets.only(right: 8),
                                child: TextField(
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      height: 2.0,
                                      color: Colors.black),
                                  controller: depositAddress,
                                  cursorColor: const Color(0xFFD6D6D6),
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFD6D6D6),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF767676),
                                        ),
                                      ),
                                      suffixStyle:
                                          TextStyle(color: Colors.green)),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                        'assets/icons/icon-important.png'),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Important',
                                      style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Send to this address using the Ethereum Network (ERC-20)',
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  color: Color(0xFF767676),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Avaliable',
                                          style: TextStyle(
                                            fontFamily: AppTextSetting.APP_FONT,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '5.5 ETH',
                                          style: TextStyle(
                                            fontFamily: AppTextSetting.APP_FONT,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Container(
                                      // color: Colors.grey.shade300,
                                      padding: const EdgeInsets.all(15),
                                      height: 70,
                                      width: widthScreen,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE5E5E5),
                                        border: Border.all(
                                          color: const Color(0xFFE5E5E5),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                'Total Asset',
                                                style: TextStyle(
                                                  color: Color(0xFF646464),
                                                  fontFamily:
                                                      AppTextSetting.APP_FONT,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '7.5 ETH',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      AppTextSetting.APP_FONT,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                'Lock to Loan',
                                                style: TextStyle(
                                                  color: Color(0xFF646464),
                                                  fontFamily:
                                                      AppTextSetting.APP_FONT,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                ' 5 ETH',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      AppTextSetting.APP_FONT,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Amount',
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 47,
                                margin: const EdgeInsets.only(right: 8),
                                child: TextField(
                                  controller: amountTxt,
                                  cursorColor: const Color(0xFFD6D6D6),
                                  decoration: const InputDecoration(
                                    hintText: '0.0',
                                    suffixText: 'ETH MAX',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFD6D6D6),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF767676),
                                      ),
                                    ),
                                    suffixStyle: TextStyle(
                                      color: AppTextSetting.COLOR_PRIMARY,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'Tips',
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  color: Color(0xFFA4A4A4),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.circle,
                                          size: 7,
                                          color: Color(0xFFA4A4A4),
                                        ),
                                        Text(
                                          '  24hr Withdrawal Limit : 10 ETH  per Day',
                                          style: TextStyle(
                                            fontFamily: AppTextSetting.APP_FONT,
                                            fontSize: 14,
                                            color: Color(0xFFA4A4A4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Icon(
                                          Icons.circle,
                                          size: 7,
                                          color: Color(0xFFA4A4A4),
                                        ),
                                        Text(
                                          '  We will not credit your account with tokens from \nthat sale.',
                                          style: TextStyle(
                                            fontFamily: AppTextSetting.APP_FONT,
                                            fontSize: 14,
                                            color: Color(0xFFA4A4A4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Transations',
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              const Divider(color: Colors.grey),
                            ],
                          ),
                        ),
                        Container(
                          height: heightScreen * 0.65,
                          child: SingleChildScrollView(
                            child:
                                _tabSection(context, heightScreen, widthScreen),
                          ),
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  alignment: Alignment.bottomCenter,
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 650),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'Receive amount',
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontFamily: AppTextSetting.APP_FONT,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '5.5 ETH',
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontFamily: AppTextSetting.APP_FONT,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'network fee 0.00 ETH',
                            style: TextStyle(
                                color: Color(0xFF9C9C9C),
                                fontFamily: AppTextSetting.APP_FONT,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Align(
                        // alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ConfirmWithdrawDetailScreen(
                                        onInit: () {
                                          StoreProvider.of<AppState>(context)
                                              .dispatch(getLoginAction);
                                        },
                                      )),
                            );
                          },
                          child: Container(
                            width: 145,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppTextSetting.COLOR_PRIMARY,
                                width: 1,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Withdraw',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppTextSetting.COLOR_PRIMARY,
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
                ),
              ],
            ),
          );
        });
  }
}
