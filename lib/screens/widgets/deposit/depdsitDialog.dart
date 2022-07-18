import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/widgets/deposit/depositScreen.dart';

class DepositDialogScreen extends StatefulWidget {
  static const String id = "DepositDialogScreen";
  final void Function() onInit;
  final String? title;
  DepositDialogScreen({Key? key, required this.onInit, required this.title})
      : super(key: key);

  @override
  State<DepositDialogScreen> createState() => _DepositDialogScreenState();
}

class _DepositDialogScreenState extends State<DepositDialogScreen> {
  Color bgETH = const Color(0xFFF4F3F6);
  Color bgBNB = const Color(0xFFF4F3F6);
  Color bgArbitrum = const Color(0xFFF4F3F6);
  Color fontArbitrum = Colors.black;
  Color fontETH = Colors.black;
  Color fontBNB = Colors.black;
  String imageETH = 'assets/icons/icon-round.png';
  String imageBNB = 'assets/icons/icon-round.png';
  String imageArbitrum = 'assets/icons/icon-round.png';

  @override
  void initState() {
    bgETH = const Color(0xFFF4F3F6);
    bgBNB = const Color(0xFFF4F3F6);
    bgArbitrum = const Color(0xFFF4F3F6);
    fontArbitrum = Colors.black;
    fontETH = Colors.black;
    fontBNB = Colors.black;
    imageETH = 'assets/icons/icon-round.png';
    imageBNB = 'assets/icons/icon-round.png';
    imageArbitrum = 'assets/icons/icon-round.png';
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
              title: Text(widget.title.toString()),
            ),
            body: Dialog(
              insetPadding: EdgeInsets.zero,
              // contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: Alignment.bottomCenter,
              child: Container(
                width: widthScreen,
                height: 350,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // const SizedBox(width: 50),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                'Select Network',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    // color: Colors.green,
                                    margin: const EdgeInsets.only(right: 20),
                                    //
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                        'assets/icons/icon-close.png')),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        setState(() {
                          bgETH == const Color(0xFFF4F3F6)
                              ? bgETH = AppTextSetting.COLOR_PRIMARY
                              : bgETH = const Color(0xFFF4F3F6);

                          fontETH == Colors.white
                              ? fontETH = Colors.black
                              : fontETH = Colors.white;
                          imageETH == 'assets/icons/icon-round.png'
                              ? imageETH = 'assets/icons/icon-check-round.png'
                              : imageETH = 'assets/icons/icon-round.png';

                          bgArbitrum = const Color(0xFFF4F3F6);
                          fontArbitrum == Colors.white;
                          imageArbitrum == 'assets/icons/icon-round.png';
                          bgBNB = const Color(0xFFF4F3F6);
                          fontBNB == Colors.white;
                          imageBNB == 'assets/icons/icon-round.png';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DepositScreen(
                                    onInit: () {
                                      StoreProvider.of<AppState>(context)
                                          .dispatch(getLoginAction);
                                    },
                                    title: widget.title,
                                    valueNetwork: '1',
                                  )),
                        );
                        // Navigator.pop(context);

                        print('Ethereum (ERC20)');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: widthScreen,
                        height: 60,
                        decoration: BoxDecoration(
                          color: bgETH,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: Image.asset(imageETH),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Ethereum (ERC20)',
                              style: TextStyle(
                                fontFamily: AppTextSetting.APP_FONT,
                                fontSize: 16,
                                color: fontETH,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        setState(() {
                          bgBNB == const Color(0xFFF4F3F6)
                              ? bgBNB = AppTextSetting.COLOR_PRIMARY
                              : bgBNB = const Color(0xFFF4F3F6);

                          fontBNB == Colors.white
                              ? fontBNB = Colors.black
                              : fontBNB = Colors.white;
                          imageBNB == 'assets/icons/icon-round.png'
                              ? imageBNB = 'assets/icons/icon-check-round.png'
                              : imageBNB = 'assets/icons/icon-round.png';

                          bgArbitrum == const Color(0xFFF4F3F6)
                              ? bgArbitrum = AppTextSetting.COLOR_PRIMARY
                              : bgArbitrum = const Color(0xFFF4F3F6);

                          bgArbitrum = const Color(0xFFF4F3F6);
                          fontArbitrum == Colors.white;
                          imageArbitrum == 'assets/icons/icon-round.png';
                          bgETH = const Color(0xFFF4F3F6);
                          fontETH = Colors.black;
                          imageETH = 'assets/icons/icon-round.png';

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DepositScreen(
                                      onInit: () {
                                        StoreProvider.of<AppState>(context)
                                            .dispatch(getLoginAction);
                                      },
                                      title: widget.title,
                                      valueNetwork: '2',
                                    )),
                          );
                        });
                        print('BNB Smart Chain (BEP20)');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: widthScreen,
                        height: 60,
                        decoration: BoxDecoration(
                          color: bgBNB,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 15),
                                child: Image.asset(imageBNB)),
                            const SizedBox(width: 20),
                            Text(
                              'BNB Smart Chain (BEP20)',
                              style: TextStyle(
                                fontFamily: AppTextSetting.APP_FONT,
                                fontSize: 16,
                                color: fontBNB,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        setState(() {
                          bgArbitrum == const Color(0xFFF4F3F6)
                              ? bgArbitrum = AppTextSetting.COLOR_PRIMARY
                              : bgArbitrum = const Color(0xFFF4F3F6);

                          fontArbitrum == Colors.white
                              ? fontArbitrum = Colors.black
                              : fontArbitrum = Colors.white;
                          imageArbitrum == 'assets/icons/icon-round.png'
                              ? imageArbitrum =
                                  'assets/icons/icon-check-round.png'
                              : imageArbitrum = 'assets/icons/icon-round.png';

                          bgETH = const Color(0xFFF4F3F6);
                          bgBNB = const Color(0xFFF4F3F6);
                          fontETH = Colors.black;
                          fontBNB = Colors.black;
                          imageETH = 'assets/icons/icon-round.png';
                          imageBNB = 'assets/icons/icon-round.png';

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DepositScreen(
                                      onInit: () {
                                        StoreProvider.of<AppState>(context)
                                            .dispatch(getLoginAction);
                                      },
                                      title: widget.title,
                                      valueNetwork: '3',
                                    )),
                          );
                        });
                        print('Arbitrum One');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: widthScreen,
                        height: 60,
                        decoration: BoxDecoration(
                          color: bgArbitrum,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: Image.asset(imageArbitrum),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Arbitrum One',
                              style: TextStyle(
                                fontFamily: AppTextSetting.APP_FONT,
                                fontSize: 16,
                                color: fontArbitrum,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
