import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/widgets/deposit/depositScreen.dart';
import 'package:peer_money/screens/widgets/deposit/transationsHistoryScreen.dart';
import 'package:peer_money/screens/widgets/withdraw/withdrawScreen.dart';
import 'package:peer_money/testCode/tabbar.dart';

class AssetsScreen extends StatefulWidget {
  static const String id = "AssetsScreen";
  final void Function() onInit;
  const AssetsScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  Color myColor = const Color(0xff00bfa5);

  Future<void> _showDialogDeposit(
      double widthScreen, double heightScreen) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          height: 50,
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 500),
          decoration:const BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft:  Radius.circular(40),
            ),
          ),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            alignment: Alignment.topCenter,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // const SizedBox(width: 50),
                const Text(
                  'Select Network',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 100),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      alignment: Alignment.topRight,
                      width: 20,
                      height: 20,
                      child: Image.asset('assets/icons/icon-close.png')),
                ),
              ],
            ),
            // content: SingleChildScrollView(
            //   child: ListBody(
            //     children: const [

            //     ],
            //   ),
            // ),
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: widthScreen,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F3F6),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: InkWell(
                            onTap: () {
                              print('Ethereum (ERC20)');
                            },
                            child: Image.asset('assets/icons/icon-round.png'))),
                    const SizedBox(width: 10),
                    const Text(
                      'Ethereum (ERC20)',
                      style: TextStyle(
                        fontFamily: AppTextSetting.APP_FONT,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: widthScreen,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F3F6),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: InkWell(
                            onTap: () {
                              print('BNB Smart Chain (BEP20)');
                            },
                            child: Image.asset('assets/icons/icon-round.png'))),
                    const SizedBox(width: 20),
                    const Text(
                      'BNB Smart Chain (BEP20)',
                      style: TextStyle(
                        fontFamily: AppTextSetting.APP_FONT,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: widthScreen,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F3F6),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: InkWell(
                            onTap: () {
                              print('Arbitrum One');
                            },
                            child: Image.asset('assets/icons/icon-round.png'))),
                    const SizedBox(width: 10),
                    const Text(
                      'Arbitrum One',
                      style: TextStyle(
                        fontFamily: AppTextSetting.APP_FONT,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void showMemberMenu() async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(150, 500, 150, 100),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Text(
            "ROHIT",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.green),
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            "REKHA",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.green),
          ),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text(
            "DHRUV",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.green),
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) print(value);
    });
  }

  @override
  List<Widget> listAssestData(BuildContext context, double heightScreen,
      double widthScreen, dynamic item) {
    List<Widget> card = [];
    for (int i = 0; i < item.length; i++) {
      card.add(InkWell(
        onTap: () {},
        child: Container(
            height: 134,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    item[i]['image'].toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item[i]['title'].toString(),
                                      style: const TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      item[i]['name'].toString(),
                                      style: const TextStyle(
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF767676)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  item[i]['value1'].toString(),
                                  style: const TextStyle(
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  item[i]['value2'].toString(),
                                  style: const TextStyle(
                                      fontFamily: AppTextSetting.APP_FONT,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF767676)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              /* showGeneralDialog(
                                  barrierLabel: "Inter",
                                  barrierDismissible: false,
                                  barrierColor: Colors.black.withOpacity(0.5),
                                  // transitionDuration:
                                  //     Duration(milliseconds: 700),
                                  context: context,
                                  pageBuilder: (context, anim1, anim2) {
                                    return Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 0, left: 0, right: 0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        height: 400,
                                        width: widthScreen,
                                        child: Stack(
                                          children: [
                                            // IconButton(
                                            //   onPressed:null,
                                            //   icon: Padding(
                                            //       padding:
                                            //           const EdgeInsets.only(
                                            //               left: 4,
                                            //               right: 4,
                                            //               top: 0),
                                            //       child: Image.asset(
                                            //         'assets/icons/icon-close.png',
                                            //         color: Colors.black,
                                            //       )),
                                            // ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 15, right: 25),
                                                  width: 15,
                                                  height: 15,
                                                  child: Image.asset(
                                                    'assets/icons/icon-close.png',
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: const Text(
                                                    'Select Network',
                                                    style: TextStyle(
                                                      fontFamily: AppTextSetting
                                                          .APP_FONT,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });*/

                              // showMemberMenu();
                              _showDialogDeposit(widthScreen, heightScreen);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => DepositScreen(
                              //             onInit: () {
                              //               StoreProvider.of<AppState>(context)
                              //                   .dispatch(getLoginAction);
                              //             },
                              //             title: item[i]['title'].toString(),
                              //           )),
                              // );
                            },
                            child: Container(
                              width: 145,
                              height: 38,
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
                                  'Deposit',
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WithdrawScreen(
                                    onInit: () {
                                      StoreProvider.of<AppState>(context)
                                          .dispatch(getLoginAction);
                                    },
                                    title: item[i]['title'].toString(),
                                  ),
                                ),
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
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                )
              ],
            )),
      ));
    }
    return card;
  }

  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          // return Scaffold(
          //   appBar: AppBar(title: const Text('data')),
          //   body: Column(
          //     children:const [
          //       Text('data'),
          //       Text('data')
          //     ],
          //   ),
          // );
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
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
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TransationsHistoryScreen(
                                              onInit: () {
                                                StoreProvider.of<AppState>(
                                                        context)
                                                    .dispatch(getLoginAction);
                                              },
                                            )),
                                  );
                                },
                                icon: Image.asset(
                                  'assets/icons/icon-clock.png',
                                  color: AppTextSetting.COLOR_PRIMARY,
                                ),
                              ),
                              const Text(
                                'History',
                                style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppTextSetting.COLOR_PRIMARY,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: listAssestData(context, heightScreen,
                            widthScreen, AppTextSetting.ASSETS_VALUE),
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}
