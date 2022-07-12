import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;

class DepositScreen extends StatefulWidget {
  static const String id = "DepositScreen";
  final void Function() onInit;
  final String? title;
  const DepositScreen({Key? key, required this.onInit, required this.title})
      : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final depositAddress = TextEditingController();

  GlobalKey _globalKey = GlobalKey();

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
    _toastInfo(info);
  }

  _saveScreen() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await (image.toByteData(format: ui.ImageByteFormat.png));
      if (byteData != null) {
        final result = await ImageGallerySaver.saveImage(
            byteData.buffer.asUint8List(),
            quality: 1080,
            name: 'qr-code-deposit');
        print(result);
        // _toastInfo(result.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  _toastInfo(String info) {
    Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
  }

  void initState() {
    depositAddress.text = 'Oxa335xerwerwjk4w2342432D52qWERz56';
    super.initState();
  }

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
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: listDepositAll(context, heightScreen, widthScreen,
                        AppTextSetting.DEPOSIT_LIST),
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

  Future<void> _showMyDialog(double widthScreen, double heightScreen) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          width: widthScreen,
          height: 385,
          child: AlertDialog(
            // backgroundColor: Colors.amberAccent,
            // title: Image.asset('assets/icons/icon-close.png',scale: 10,),
            // titleTextStyle: const TextStyle(
            //   fontFamily: AppTextSetting.APP_FONT,
            //   fontSize: 12,
            //   color: Colors.black,
            // ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
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
                  const SizedBox(height: 10),
                  Text(
                    depositAddress.text,
                    style: const TextStyle(
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    child: RepaintBoundary(
                      key: _globalKey,
                      child: QrImage(
                        data: depositAddress.text,
                        version: QrVersions.auto,
                        size: 200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _saveScreen();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 162,
                      height: 38,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppTextSetting.COLOR_PRIMARY,
                          width: 1,
                        ),
                      ),
                      child: Container(
                        width: 185,
                        height: 45,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Download',
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
        );
      },
    );
  }

  Future<void> _showMyDialogCopy(
      double widthScreen, double heightScreen) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          width: widthScreen,
          height: 40,
          child: AlertDialog(
            backgroundColor: const Color(0xFF424242),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Destination Address Copied to Clipboard',
                        style: TextStyle(
                          fontFamily: AppTextSetting.APP_FONT,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 15,
                          height: 15,
                          child: Image.asset(
                            'assets/icons/icon-close.png',
                            color: const Color(0xFFF2F2F2),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   child: const Text(
                  //     'Destination Address Copied to Clipboard',
                  //     style: TextStyle(
                  //       fontFamily: AppTextSetting.APP_FONT,
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).pop();
                  //   },
                  //   child: Container(
                  //       alignment: Alignment.topRight,
                  //       width: 20,
                  //       height: 20,
                  //       child: Image.asset(
                  //         'assets/icons/icon-close.png',
                  //         color: const Color(0xFFF2F2F2),
                  //       )),
                  // ),
                ],
              ),
            ),
            actions: <Widget>[],
          ),
        );
      },
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
              title: Text('Deposit ${widget.title.toString()}'),
              backgroundColor: AppTextSetting.COLOR_PRIMARY,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Deposit Address',
                          style: TextStyle(
                            fontFamily: AppTextSetting.APP_FONT,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: depositAddress,
                          cursorColor: const Color(0xFFD6D6D6),
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD6D6D6),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD6D6D6),
                                ),
                              ),
                              suffixStyle: TextStyle(color: Colors.green)),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                print('view qr');
                                _showMyDialog(widthScreen, heightScreen);
                              },
                              child: Container(
                                width: 162,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: AppTextSetting.COLOR_PRIMARY,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 2.0),
                                      child: Image.asset(
                                          'assets/icons/icon-oqcode.png'),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 5.0),
                                      child: Text(
                                        'View QR',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: AppTextSetting.APP_FONT,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // _showMyDialogCopy(widthScreen, heightScreen);
                                Fluttertoast.showToast(
                                    msg:
                                        "Destination Address Copied to Clipboard",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: const Color(0xFF424242),
                                    textColor: Colors.white,
                                    fontSize: 13.0);
                                Clipboard.setData(
                                    ClipboardData(text: depositAddress.text));
                                print('copy $depositAddress');
                              },
                              child: Container(
                                width: 162,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppTextSetting.COLOR_PRIMARY,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 2.0),
                                      child: Image.asset(
                                          'assets/icons/icon-copy.png'),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Copy',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppTextSetting.COLOR_PRIMARY,
                                            fontFamily: AppTextSetting.APP_FONT,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          child: Row(
                            children: [
                              Image.asset('assets/icons/icon-important.png'),
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
                        const SizedBox(height: 30),
                        const Text(
                          'Transations',
                          style: TextStyle(
                            fontFamily: AppTextSetting.APP_FONT,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        /*Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 200,
                          child: RepaintBoundary(
                            key: _globalKey,
                            child: QrImage(
                              // key: _globalKey,
                              data: depositAddress.text,
                              version: QrVersions.auto,
                              size: 200,
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _saveScreen();
                                // Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 162,
                                height: 38,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppTextSetting.COLOR_PRIMARY,
                                    width: 1,
                                  ),
                                ),
                                child: Container(
                                  width: 185,
                                  height: 45,
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    'Download',
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
                        ),*/
                        Container(
                          height: 500,
                          child: SingleChildScrollView(
                            child:
                                _tabSection(context, heightScreen, widthScreen),
                          ),
                        ),
                        // Column(children: [
                        //   _tabSection(context,heightScreen,widthScreen)
                        // ],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
