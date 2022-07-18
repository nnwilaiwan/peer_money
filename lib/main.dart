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
import 'package:peer_money/screens/widgets/deposit/depdsitDialog.dart';
import 'package:peer_money/screens/widgets/deposit/depositScreen.dart';
import 'package:peer_money/screens/widgets/deposit/historyDetailScreen.dart';
import 'package:peer_money/screens/widgets/deposit/transationsHistoryScreen.dart';
import 'package:peer_money/screens/widgets/withdraw/confirmWithdraw.dart';
import 'package:peer_money/screens/widgets/withdraw/historyWithdrawDetails.dart';
import 'package:peer_money/screens/widgets/withdraw/verificationPinCode.dart';
import 'package:peer_money/screens/widgets/withdraw/withdrawFailScreen.dart';
import 'package:peer_money/screens/widgets/withdraw/withdrawProcessingScreen.dart';
import 'package:peer_money/screens/widgets/withdraw/withdrawScreen.dart';
import 'package:peer_money/testCode/pieChart.dart';
import 'package:peer_money/testCode/sendOTPScreen.dart';
import 'package:peer_money/testCode/testConnectApi.dart';
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
          DepositScreen.id: (context) {
            return DepositScreen(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(getLoginAction);
              },
              title: null,
              valueNetwork: null,
            );
          },
          WithdrawScreen.id: (context) {
            return WithdrawScreen(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(getLoginAction);
              },
              title: null,
            );
          },
          TransationsHistoryScreen.id: (context) {
            return TransationsHistoryScreen(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
          HistoryDetailScreen.id: (context) {
            return HistoryDetailScreen(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
          HistoryWithdrawDetailScreen.id: (context) {
            return HistoryWithdrawDetailScreen(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
          ConfirmWithdrawDetailScreen.id: (context) {
            return ConfirmWithdrawDetailScreen(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
          VerificationPincodeScreen.id: (context) {
            return VerificationPincodeScreen(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
          WithdrawProcessingScreen.id: (context) {
            return WithdrawProcessingScreen(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
          WithdrawFailScreen.id: (context) {
            return WithdrawFailScreen(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
          DepositDialogScreen.id: (context) {
            return  DepositDialogScreen(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(getLoginAction);
              },
              title: null,
            );
          },
          PieChartTest.id: (context) {
            return PieChartTest(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
          TestConnectApi.id: (context) {
            return TestConnectApi(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            });
          },
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Inter',
        ),
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
          // scale: 10,
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

/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
         home: Home()
      );
  }
}

class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  @override
  void initState() {
    scrollController.addListener(() { //listener 
      showbtn = true;
      print(scrollController.offset); 
      //.offset is double value
      /* Outputs --------
          I/flutter (26854): 32.349831321022975
          I/flutter (26854): 33.07679332386385
          I/flutter (26854): 33.80375532670473
          I/flutter (26854): 34.530717329545666
          I/flutter (26854): 35.2576793323866
          I/flutter (26854): 35.62113813920479
          I/flutter (26854): 35.984641335227536
          I/flutter (26854): 36.34810014204572
          I/flutter (26854): 36.71160333806847
          I/flutter (26854): 37.07506214488666
          I/flutter (26854): 37.80202414772759
          I/flutter (26854): 38.16552734375034
      */ 

      setState(() {
         //update state 
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
            title: Text("Get Scroll Position in Flutter"),
            backgroundColor: Colors.redAccent
         ),
         floatingActionButton: Card(
            child: showbtn? 
                   Text("Scroll Position: " + scrollController.offset.toString(),
                        style: TextStyle(fontSize: 20),)
                   :Text("xxx")
         ),
         body: SingleChildScrollView( 
                  controller: scrollController,
                  child:Container(
                    height: 1000,
                    width: 500,
                
              )
          )
    );
  } 
}*/

/*import 'package:flutter/material.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/testCode/testCardVerify.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Checkbox Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Checkbox Dialog Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checkboxValueCity = false;
  List<String> allCities = ['Alpha', 'Beta', 'Gamma'];
  List<String> selectedCities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return _MyDialog();
                });
          }),
    );
  }
}

class _MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<_MyDialog> {
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
    return Dialog(
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
                            child: Image.asset('assets/icons/icon-close.png')),
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
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestVerifyCard(),
                  ),
                );
                Navigator.of(context);

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
                      ? imageArbitrum = 'assets/icons/icon-check-round.png'
                      : imageArbitrum = 'assets/icons/icon-round.png';

                  // BNB = false;
                  // Arbitrum = true;
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
  }
}*/
