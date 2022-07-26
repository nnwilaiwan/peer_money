import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/widgets/loanAmount/loanAmountScreen.dart';
import 'package:peer_money/screens/widgets/loanAmount/loanDetail.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LoanScreen extends StatefulWidget {
  static const String id = "LoanScreen";
  final void Function() onInit;
  const LoanScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  Widget _tabSection(
      BuildContext context, double heightScreen, double widthScreen) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TabBar(
            tabs: [
              Tab(text: "Active"),
              Tab(text: "Pending"),
              Tab(text: "Closed"),
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
                    children: listLoanData(context, heightScreen, widthScreen,
                        AppTextSetting.LIST_LOAN),
                  ),
                ),
                // Text(''),
                const Text(""),
                const Text(""),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listLoanData(BuildContext context, double heightScreen,
      double widthScreen, dynamic item) {
    List<Widget> card = [];
    for (int i = 0; i < item.length; i++) {
      card.add(InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoanDetailScreen(
                      onInit: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(getLoginAction);
                      },
                    )),
          );
        },
        child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              border: Border.all(
                width: 0.5,
                color: const Color(0xFFD6D6D6),
              ),
            ),
            height: 200,
            child: Column(
              children: [
                Container(
                  height: 48,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF66CE87),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  // margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Text(
                        'Loan No.',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item[i]['loan_no'].toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Replay Per Month',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            item[i]['value1'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'THB',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Total of Payments',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Total loan and Interest',
                            style: TextStyle(
                              color: Color(0xFF767676),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            item[i]['value2'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'THB',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status Payment',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item[i]['status'],
                            style: const TextStyle(
                              color: AppTextSetting.COLOR_PRIMARY,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            item[i]['date'],
                            style: const TextStyle(
                              color: Color(0xFF767676),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // const Divider(
                //   color: Colors.grey,
                // )
              ],
            )),
      ));
    }
    return card;
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
                child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Image.asset('assets/images/Loan.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoanAmountScreen(
                                onInit: () {
                                  StoreProvider.of<AppState>(context)
                                      .dispatch(getLoginAction);
                                },
                              )),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: widthScreen * 0.55,
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
                        'Enter Loan Amount',
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
                Container(
                  height: 500,
                  child: SingleChildScrollView(
                    child: _tabSection(context, heightScreen, widthScreen),
                  ),
                ),
              ],
            )),
          );
        });
  }
}
