import 'dart:io' show exit;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/contentWidget.dart';
import 'package:peer_money/models/screenIndex.dart';
import 'package:peer_money/models/baseWidget.dart';
import 'package:peer_money/screens/navigations/navigationMenuBar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "Home";
  final void Function() onInit;
  int? initScreen;
  int? tabIndex;

  HomeScreen(
      {Key? key,
      required this.onInit,
      required this.initScreen,
      required this.tabIndex})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var screenIndex = new ScreenIndex(0);
  int screenTabIndex = 0;

  // Future<int> reLoginPin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   DateTime now = new DateTime.now();
  //   int loginTime = prefs.getInt('logintime');

  //   if (now.minute < loginTime) {
  //     return (now.minute + 60) - loginTime;
  //   } else {
  //     return now.minute - loginTime;
  //   }
  // }

  void setCurrentTab(int tab) async {
    // var sum = await reLoginPin();
    var sum = 1;
    print('====> logintime : ' + sum.toString());
    setState(() {
      /*PINCode(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(getLoginAction);
              },
              title: 'Enter Your PIN Code',
              type: '1',
            ) */
      //set minute
      if (sum >= 10) {
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(
        //         builder: (context) => PINCode(
        //               onInit: () {
        //                 StoreProvider.of<AppState>(context)
        //                     .dispatch(getLoginAction);
        //               },
        //               title: 'Enter Your PIN Code',
        //               type: '1',
        //             )),
        //     (Route<dynamic> route) => false);
      } else {
        screenIndex.intIndex = tab;
        if (tab != 2) {
          screenTabIndex = 0;
        }
      }
    });
    print('====> ScreenIndex : ' + screenIndex.intIndex.toString());
  }

  //bottomMenubar
  BottomNavigationBar bottomBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          NavigationMenuBar().buildBottomNavigationBarItem2(
              // FontAwesomeIcons.house,
              // FontAwesomeIcons.house,
              'assets/icons/home-icon.png',
              'assets/icons/home-icon.png',
              0,
              screenIndex,
              AppTextSetting.BTB_TITLE_0),
          NavigationMenuBar().buildBottomNavigationBarItem2(
              // FontAwesomeIcons.wallet,
              // FontAwesomeIcons.wallet,
              'assets/icons/assest-icon.png',
              'assets/icons/assest-icon.png',
              1,
              screenIndex,
              AppTextSetting.BTB_TITLE_1),
          NavigationMenuBar().buildBottomNavigationBarItem2(
              // FontAwesomeIcons.handHoldingDollar,
              // FontAwesomeIcons.handHoldingDollar,
              'assets/icons/hand-coin-line.png',
              'assets/icons/hand-coin-line.png',
              2,
              screenIndex,
              AppTextSetting.BTB_TITLE_2),
          NavigationMenuBar().buildBottomNavigationBarItem2(
              // FontAwesomeIcons.user,
              // FontAwesomeIcons.user,
              'assets/icons/profile-icon.png',
              'assets/icons/profile-icon.png',
              3,
              screenIndex,
              AppTextSetting.BTB_TITLE_3),
        ],
        currentIndex: screenIndex.index > 3 ? 0 : screenIndex.index,
        selectedItemColor: AppTextSetting.COLOR_PRIMARY,
        // unselectedItemColor: AppTextSetting.COLOR_PRIMARY,
        onTap: setCurrentTab,
      );

  late DateTime backbuttonpressedTime;
  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      // Fluttertoast.showToast(
      //     msg: "กด 2 ครั้งเพื่อจบการทำงานของแอปพลิเคชัน",
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white);
      return false;
    }

    return exit(0); //Utility().exitApp(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initScreen != null) {
      setState(() {
        screenIndex.index = widget.initScreen!;
        widget.initScreen = null;
      });
    }
    if (widget.tabIndex != null) {
      setState(() {
        screenTabIndex = widget.tabIndex!;
        widget.tabIndex = null;
      });
      print('====> screenTab : ' + screenTabIndex.toString());
    }
    return WillPopScope(
      onWillPop: () => onWillPop(),
      child: BaseWidget(
        screenIndex: screenIndex,
        child: Scaffold(
          appBar: 
                  screenIndex.index == 1 ? NavigationMenuBar().mainAppBarAssest(context, 'Assets'):
                  screenIndex.index == 2 ||
                  screenIndex.index == 3
              // screenIndex.index == 6 ||
              // screenIndex.index == 7 ||
              // screenIndex.index == 8 ||
              // screenIndex.index == 9
              ? null
              : NavigationMenuBar().mainAppBar(
                  context, ''), //NavigationMenuBar().appBar(context),
          body: Container(
            //color: Color(AppTextSetting.APP_BG_COLOR), //Colors.grey[300],
            child: Container(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ContentWidget(
                        screenTabIndex: screenTabIndex,
                      ),
                    ],
                  ),

                  //this.widgets
                ],
              ),
            ),
          ),
          bottomNavigationBar: bottomBar(),
        ),
      ),
    );
  }
}
