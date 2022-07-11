import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';

class AssetsScreen extends StatefulWidget {
  static const String id = "AssetsScreen";
  final void Function() onInit;
  const AssetsScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
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
                            onTap: (){
                              
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
                          Container(
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
                  margin: const EdgeInsets.all(15.0),
                  child: Column(
                    children: listAssestData(context, heightScreen, widthScreen,
                        AppTextSetting.ASSETS_VALUE),
                  )),
            ),
          );
        });
  }
}
