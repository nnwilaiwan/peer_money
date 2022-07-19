import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/widgets/deposit/transationsHistoryScreen.dart';

class WithdrawFailScreen extends StatefulWidget {
  static const String id = "WithdrawFailScreen";
  final void Function() onInit;

  const WithdrawFailScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<WithdrawFailScreen> createState() => _WithdrawFailScreenState();
}

class _WithdrawFailScreenState extends State<WithdrawFailScreen> {
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
              automaticallyImplyLeading: false,
              title: const Text(
                'Withdraw Fail',
                style: TextStyle(
                  fontFamily: AppTextSetting.APP_FONT,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: AppTextSetting.COLOR_PRIMARY,
            ),
            body: Stack(
              children: [
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 120),
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Container(
                                width: 120,
                                height: 119,
                                child: Image.asset(
                                  'assets/images/wrong.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Withdraw Fail',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // color: Colors.amber,
                                    child: const Text(
                                      '0.1211234',
                                      style: TextStyle(
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    // color: Colors.black,
                                    child: const Text(
                                      'ETH',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Estimated completion time : 23.03.2017 15:43',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'You will receive an email once withdraw is completed.\n View history for the latest updates.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
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
                      // Navigator.pop(context);
                    },
                    child: Container(
                      width: 343,
                      height: 45,
                      margin: const EdgeInsets.only(bottom: 45),
                      decoration: BoxDecoration(
                        color: AppTextSetting.COLOR_PRIMARY,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'View History',
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
                ),
              ],
            ),
          );
        });
  }
}
