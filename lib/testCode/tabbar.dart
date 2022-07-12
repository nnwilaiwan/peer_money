import 'package:flutter/material.dart';
import 'package:peer_money/models/appTextSetting.dart';

class TestScreen extends StatefulWidget {
  final String title;
  const TestScreen({Key? key, required this.title}) : super(key: key);
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Widget> listDepositAll(BuildContext context, double heightScreen,
      double widthScreen, dynamic item) {
    List<Widget> card = [];
    for (int i = 0; i < item.length; i++) {
      card.add(InkWell(
        onTap: () {},
        child: Container(
            height: 60,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            )),
      ));
    }
    return card;
  }

  Widget _tabSection(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: const TabBar(
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
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Container(
                    // height: 100,
                    child: Column(
                      children: listDepositAll(context, heightScreen,
                          widthScreen, AppTextSetting.DEPOSIT_LIST),
                    ),
                  ),
                ),
                const Text("Deposit"),
                const Text("Withdraw"),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit ${widget.title.toString()}'),
        backgroundColor: AppTextSetting.COLOR_PRIMARY,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                  'Transations',
                  style: TextStyle(
                    fontFamily: AppTextSetting.APP_FONT,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
              _tabSection(context),
            ],
          ),
        ),
      ),
    );
  }
}
