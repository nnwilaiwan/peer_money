import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/widgets/withdraw/withdrawFailScreen.dart';
import 'package:peer_money/screens/widgets/withdraw/withdrawProcessingScreen.dart';

class VerificationPincodeScreen extends StatefulWidget {
  static const String id = "VerificationPincodeScreen";
  final void Function() onInit;

  const VerificationPincodeScreen({Key? key, required this.onInit})
      : super(key: key);

  @override
  State<VerificationPincodeScreen> createState() =>
      _VerificationPincodeScreenState();
}

class _VerificationPincodeScreenState extends State<VerificationPincodeScreen> {
  var selectedindex = 0;
  String code = '';
  addDigit(int digit) {
    setState(() {
      code = code + digit.toString();
      print('Code is $code');
      selectedindex = code.length;
      if (code.toString() == '000000') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WithdrawProcessingScreen(
                    onInit: () {
                      StoreProvider.of<AppState>(context)
                          .dispatch(getLoginAction);
                    },
                  )),
        );
        code = '';
      } else if (code.toString() == '999999') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WithdrawFailScreen(
                    onInit: () {
                      StoreProvider.of<AppState>(context)
                          .dispatch(getLoginAction);
                    },
                  )),
        );
        code = '';
      }
    });
  }

  backspace() {
    if (code.isEmpty) {
      return;
    }
    setState(() {
      code = code.substring(0, code.length - 1);
      selectedindex = code.length;
    });
  }

  @override
  void initState() {
    code = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          TextStyle textStyle = const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          );
          return Scaffold(
            // background/assets-for-api-docs/assets/material/Colors.blacks.pngColor: Colors.red,
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Verification',
                style: TextStyle(
                  fontFamily: AppTextSetting.APP_FONT,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: AppTextSetting.COLOR_PRIMARY,
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    // color: Colors.green,
                    margin: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/icons/Peer_logo_orange.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter PIN',
                    style: TextStyle(
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DigitHolder(
                            index: 0,
                            selectedIndex: selectedindex,
                            code: code,
                          ),
                          DigitHolder(
                              index: 1,
                              selectedIndex: selectedindex,
                              code: code),
                          DigitHolder(
                              index: 2,
                              selectedIndex: selectedindex,
                              code: code),
                          DigitHolder(
                              index: 3,
                              selectedIndex: selectedindex,
                              code: code),
                          DigitHolder(
                              index: 4,
                              selectedIndex: selectedindex,
                              code: code),
                          DigitHolder(
                              index: 5,
                              selectedIndex: selectedindex,
                              code: code),
                        ],
                      )),
                  const SizedBox(height: 50),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(1);
                                    },
                                    child: Text('1', style: textStyle)),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(2);
                                    },
                                    child: Text('2', style: textStyle)),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(3);
                                    },
                                    child: Text('3', style: textStyle)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(4);
                                    },
                                    child: Text('4', style: textStyle)),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(5);
                                    },
                                    child: Text('5', style: textStyle)),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(6);
                                    },
                                    child: Text('6', style: textStyle)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(7);
                                    },
                                    child: Text('7', style: textStyle)),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(8);
                                    },
                                    child: Text('8', style: textStyle)),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(9);
                                    },
                                    child: Text('9', style: textStyle)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                  onPressed: () {
                                    print("finger print");
                                  },
                                  child: Image.asset(
                                    "assets/icons/icon_finger_print.png",
                                    fit: BoxFit.fitWidth,
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      addDigit(0);
                                    },
                                    child: Text('0', style: textStyle)),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {
                                      backspace();
                                    },
                                    child: Icon(Icons.backspace_outlined,
                                        color: Colors.black.withBlue(40),
                                        size: 30)),
                              ),
                            ],
                          ),
                        ),
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

class DigitHolder extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String code;
  const DigitHolder({
    required this.selectedIndex,
    required this.index,
    required this.code,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 12,
      width: 12,
      margin: const EdgeInsets.only(right: 18),
      child: code.length > index
          ? Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(234, 235, 170, 4),
                shape: BoxShape.circle,
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
    );
  }
}
