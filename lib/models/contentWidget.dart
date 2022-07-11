import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/models/screenIndex.dart';
import 'package:peer_money/models/baseWidget.dart';
import 'package:peer_money/screens/assets/assetsScreen.dart';
import 'package:peer_money/screens/homeScreen/homeScreen.dart';
import 'package:peer_money/screens/homeScreen/homeScreenDetail.dart';
import 'package:peer_money/testCode/pieChart.dart';
import 'package:peer_money/testCode/testCardVerify.dart';

class ContentWidget extends StatefulWidget {
  final int screenTabIndex;
  ContentWidget({Key? key, required this.screenTabIndex}) : super(key: key);
  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenIndex screenIndex = BaseWidget.of(context)!.screenIndex;

    switch (screenIndex.intIndex) {
      case 0:
        {
          return HomeScreenDetial(
            onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            },
            // initScreen: 0,
            // tabIndex: 0,
          );
        }
      case 1:
        {
            {
          return AssetsScreen(
            onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            },
            // initScreen: 0,
            // tabIndex: 0,
          );
        }
        // return TestVerifyCard();
        }

      default:
        {
          return const Center(child: Text('Wait...'));
        }
        break;
    }
  }
}
