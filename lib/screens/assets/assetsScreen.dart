import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/widgets/deposit/depdsitDialog.dart';
import 'package:peer_money/screens/widgets/deposit/depositScreen.dart';
import 'package:peer_money/screens/widgets/deposit/transationsHistoryScreen.dart';
import 'package:peer_money/screens/widgets/withdraw/withdrawScreen.dart';

class AssetsScreen extends StatefulWidget {
  static const String id = "AssetsScreen";
  final void Function() onInit;
  const AssetsScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  bool ETH = false;
  bool BNB = false;
  bool Arbitrum = false;
  Color _c = Colors.redAccent;
  Color bgETH = const Color(0xFFF4F3F6);
  Color bgBNB = const Color(0xFFF4F3F6);
  Color bgArbitrum = const Color(0xFFF4F3F6);
  Color fontArbitrum = Colors.black;
  Color fontETH = Colors.black;
  Color fontBNB = Colors.black;
  String imageETH = 'assets/icons/icon-round.png';
  String imageBNB = 'assets/icons/icon-round.png';
  String imageArbitrum = 'assets/icons/icon-round.png';

  String? title;
  String? networkName;

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
    widget.onInit();
  }

  Future<void> _showDialog(double widthScreen, String? title) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Container(
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
                          Expanded(
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
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
                              child: Image.asset(imageETH)),
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
                    const SizedBox(height: 20),
                    Container(
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
                            child: Image.asset(imageBNB),
                          ),
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
                    const SizedBox(height: 20),
                    Container(
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
                  ],
                ),
              ),
              actions: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatButton(
                      child: const Text('Ethereum (ERC20'),
                      onPressed: () => setState(() {
                        bgETH == const Color(0xFFF4F3F6)
                            ? bgETH = AppTextSetting.COLOR_PRIMARY
                            : bgETH = const Color(0xFFF4F3F6);

                        fontETH == Colors.white
                            ? fontETH = Colors.black
                            : fontETH = Colors.white;
                        imageETH == 'assets/icons/icon-round.png'
                            ? imageETH = 'assets/icons/icon-check-round.png'
                            : imageETH = 'assets/icons/icon-round.png';
                        print(title);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => DepositScreen(
                        //             onInit: () {
                        //               StoreProvider.of<AppState>(context)
                        //                   .dispatch(getLoginAction);
                        //             },
                        //             title: title,
                        //           )),
                        // );
                      }),
                    ),
                    FlatButton(
                        child: const Text('BNB Smart Chain (BEP20)'),
                        onPressed: () => setState(() {
                              bgBNB == const Color(0xFFF4F3F6)
                                  ? bgBNB = AppTextSetting.COLOR_PRIMARY
                                  : bgBNB = const Color(0xFFF4F3F6);

                              fontBNB == Colors.white
                                  ? fontBNB = Colors.black
                                  : fontBNB = Colors.white;
                              imageBNB == 'assets/icons/icon-round.png'
                                  ? imageBNB =
                                      'assets/icons/icon-check-round.png'
                                  : imageBNB = 'assets/icons/icon-round.png';
                            })),
                    FlatButton(
                        child: const Text('Arbitrum On'),
                        onPressed: () => setState(() {
                              bgArbitrum == const Color(0xFFF4F3F6)
                                  ? bgArbitrum = AppTextSetting.COLOR_PRIMARY
                                  : bgArbitrum = const Color(0xFFF4F3F6);

                              fontArbitrum == Colors.white
                                  ? fontArbitrum = Colors.black
                                  : fontArbitrum = Colors.white;
                              imageArbitrum == 'assets/icons/icon-round.png'
                                  ? imageArbitrum =
                                      'assets/icons/icon-check-round.png'
                                  : imageArbitrum =
                                      'assets/icons/icon-round.png';
                            }))
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showDialogDeposit(
      double widthScreen, double heightScreen, dynamic item) async {
    return showDialog<void>(
      context: context,

      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          height: 200,
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(
            bottom: 0,
            left: 0,
            right: 0,
          ),
          // decoration: const BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.only(
          //     topRight: Radius.circular(40),
          //     topLeft: Radius.circular(40),
          //   ),
          // ),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: Alignment.bottomCenter,
            /* title: Row(
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
            ),*/
            /*  content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Container(
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
                                        margin:
                                            const EdgeInsets.only(right: 20),
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
                        Container(
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
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        bgETH == const Color(0xFFF4F3F6)
                                            ? bgETH =
                                                AppTextSetting.COLOR_PRIMARY
                                            : bgETH = const Color(0xFFF4F3F6);

                                        fontETH == Colors.white
                                            ? fontETH = Colors.black
                                            : fontETH = Colors.white;
                                        imageETH ==
                                                'assets/icons/icon-round.png'
                                            ? imageETH =
                                                'assets/icons/icon-check-round.png'
                                            : imageETH =
                                                'assets/icons/icon-round.png';
                                      });
                                      print(ETH);
                                      print('Ethereum (ERC20)');
                                      widget.onInit;
                                    },
                                    child: Image.asset(imageETH)),
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
                        const SizedBox(height: 20),
                        Container(
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
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        bgBNB == const Color(0xFFF4F3F6)
                                            ? bgBNB =
                                                AppTextSetting.COLOR_PRIMARY
                                            : bgBNB = const Color(0xFFF4F3F6);

                                        fontBNB == Colors.white
                                            ? fontBNB = Colors.black
                                            : fontBNB = Colors.white;
                                        imageBNB ==
                                                'assets/icons/icon-round.png'
                                            ? imageBNB =
                                                'assets/icons/icon-check-round.png'
                                            : imageBNB =
                                                'assets/icons/icon-round.png';
                                      });
                                      print('BNB Smart Chain (BEP20)');
                                      widget.onInit;
                                    },
                                    child: Image.asset(imageBNB)),
                              ),
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
                        const SizedBox(height: 20),
                        Container(
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
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      bgArbitrum == const Color(0xFFF4F3F6)
                                          ? bgArbitrum =
                                              AppTextSetting.COLOR_PRIMARY
                                          : bgArbitrum =
                                              const Color(0xFFF4F3F6);

                                      fontArbitrum == Colors.white
                                          ? fontArbitrum = Colors.black
                                          : fontArbitrum = Colors.white;
                                      imageArbitrum ==
                                              'assets/icons/icon-round.png'
                                          ? imageArbitrum =
                                              'assets/icons/icon-check-round.png'
                                          : imageArbitrum =
                                              'assets/icons/icon-round.png';

                                      // BNB = false;
                                      // Arbitrum = true;
                                    });
                                    print('Arbitrum One');
                                    widget.onInit;
                                  },
                                  child: Image.asset(imageArbitrum),
                                ),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),*/
            actions: <Widget>[
              Container(
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
                              // for (int i = 0; i < item.length; i++) {
                              //   print(item[i]['title']);
                              // }
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
                    Container(
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
                            child: InkWell(
                                onTap: () {
                                  bgETH == const Color(0xFFF4F3F6)
                                      ? bgETH = AppTextSetting.COLOR_PRIMARY
                                      : bgETH = const Color(0xFFF4F3F6);

                                  fontETH == Colors.white
                                      ? fontETH = Colors.black
                                      : fontETH = Colors.white;
                                  imageETH == 'assets/icons/icon-round.png'
                                      ? imageETH =
                                          'assets/icons/icon-check-round.png'
                                      : imageETH =
                                          'assets/icons/icon-round.png';
                                  widget.onInit;
                                },
                                child: Image.asset(imageETH)),
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
                    const SizedBox(height: 20),
                    Container(
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
                            child: InkWell(
                                onTap: () => setState(() {
                                      bgBNB == const Color(0xFFF4F3F6)
                                          ? bgBNB = AppTextSetting.COLOR_PRIMARY
                                          : bgBNB = const Color(0xFFF4F3F6);

                                      fontBNB == Colors.white
                                          ? fontBNB = Colors.black
                                          : fontBNB = Colors.white;
                                      imageBNB == 'assets/icons/icon-round.png'
                                          ? imageBNB =
                                              'assets/icons/icon-check-round.png'
                                          : imageBNB =
                                              'assets/icons/icon-round.png';
                                    }),
                                child: Image.asset(imageBNB)),
                          ),
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
                    const SizedBox(height: 20),
                    Container(
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
                            child: InkWell(
                              onTap: () => setState(() {
                                bgArbitrum == const Color(0xFFF4F3F6)
                                    ? bgArbitrum = AppTextSetting.COLOR_PRIMARY
                                    : bgArbitrum = const Color(0xFFF4F3F6);

                                fontArbitrum == Colors.white
                                    ? fontArbitrum = Colors.black
                                    : fontArbitrum = Colors.white;
                                imageArbitrum == 'assets/icons/icon-round.png'
                                    ? imageArbitrum =
                                        'assets/icons/icon-check-round.png'
                                    : imageArbitrum =
                                        'assets/icons/icon-round.png';
                              }),
                              child: Image.asset(imageArbitrum),
                            ),
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
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
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
                                Navigator.push(
                                context,
                             
                                MaterialPageRoute(
                                    builder: (context) => DepositScreen(
                                          onInit: () {
                                            StoreProvider.of<AppState>(context)
                                                .dispatch(getLoginAction);
                                          },
                                          title: item[i]['title'].toString(),
                                          valueNetwork: '1',
                                        )),
                              );
                              // print(item[i]['title'].toString());

                              /*showDialog(
                                  useRootNavigator: false,
                                  useSafeArea: false,
                                  context: context,
                                  builder: (context) {
                                    return DepositDialog(
                                      onInit: () {
                                        StoreProvider.of<AppState>(context)
                                            .dispatch(getLoginAction);
                                      },
                                      title: item[i]['title'].toString(),
                                    );
                                    // return DepositDialogScreen(
                                    //   onInit: () {
                                    //     StoreProvider.of<AppState>(context)
                                    //         .dispatch(getLoginAction);
                                    //   },
                                    //   title: item[i]['title'].toString(),
                                    // );
                                  });*/
                            },
                            child: Container(
                              width: widthScreen * 0.44,
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

                              // _showDialog(
                              //     widthScreen, item[i]['title'].toString());
                            },
                            child: Container(
                              width: widthScreen * 0.44,
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

class DepositDialog extends StatefulWidget {
  static const String id = "DepositDialog";

  final void Function() onInit;
  final String? title;
  const DepositDialog({Key? key, required this.onInit, required this.title})
      : super(key: key);

  @override
  State<DepositDialog> createState() => _DepositDialogState();
}

class _DepositDialogState extends State<DepositDialog> {
  // List<String> _tempSelectedCities = [];
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
    // _tempSelectedCities = widget.selectedCities;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Dialog(
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
                        Navigator.pop(context);
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
          );
        });
  }
}
