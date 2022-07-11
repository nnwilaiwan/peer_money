import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/controllers/baseController.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/models/reducer.dart';
import 'package:peer_money/screens/assets/assetsScreen.dart';
import 'package:peer_money/screens/homeScreen/homeScreen.dart';
import 'package:peer_money/screens/homeScreen/homeScreenDetail.dart';
import 'package:peer_money/testCode/pieChart.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:splashscreen/splashscreen.dart';

Future<void> main() async {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(), middleware: [thunkMiddleware]);
  runApp(MaterialApp(home: MyApp(store: store)));
}

class MyApp extends StatelessWidget {
  final Store<AppState>? store;
  const MyApp({Key? key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store!,
      child: MaterialApp(
        title: '',
        routes: {
          HomeScreen.id: (context) {
            return HomeScreen(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(getLoginAction);
              },
              initScreen: 0,
              tabIndex: 0,
            );
          },
          HomeScreenDetial.id: (context) {
            return HomeScreenDetial(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
            AssetsScreen.id: (context) {
            return AssetsScreen(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
          PieChartTest.id: (context) {
            return PieChartTest(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
        },
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //bool login = false;
  bool loggedIn = false;
  dynamic location;
  dynamic latitude;
  dynamic longitude;
  DateTime dateTime = DateTime.now();
  BaseController baseController = BaseController();

  String? name;

  bool nextStep = false;

  @override
  void initState() {
    super.initState();
    //_notificationController.register();
    // this._getLocation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  loadData() async {
    BaseController baseController = BaseController();

    // baseController.beginApp();
    // baseController.checkTheme();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: HomeScreen(
          onInit: () {
            StoreProvider.of<AppState>(context).dispatch(getLoginAction);
          },
          initScreen: 0,
          tabIndex: 0,
        ),
        image: Image.asset(
          'assets/images/logo-splash.png',
          height: heightScreen,
          width: widthScreen,
          fit: BoxFit.fitHeight,
          // ÷\scale: 10,
        ),
        backgroundColor: AppTextSetting.COLOR_PRIMARY,
        photoSize: heightScreen * 0.19,
        loaderColor: Colors.transparent,
        imageBackground: const AssetImage('assets/images/bg-splash.png'),
        // loadingText:  Text(heightScreen.toString()),
        styleTextUnderTheLoader: const TextStyle(fontSize: 0.1),
      ),
    );
  }
}


/*class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  const Testxx(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTextSetting.COLOR_PRIMARY,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}*/


