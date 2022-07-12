import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peer_money/controllers/baseController.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/models/reducer.dart';
import 'package:peer_money/screens/assets/assetsScreen.dart';
import 'package:peer_money/screens/deposit/depositScreen.dart';
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
          DepositScreen.id: (context) {
            return DepositScreen(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            },title: null,);
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




// import 'dart:async';
// import 'dart:typed_data';
// import 'dart:ui' as ui;

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Save image to gallery',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   GlobalKey _globalKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();

//     _requestPermission();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Save image to gallery"),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               RepaintBoundary(
//                 key: _globalKey,
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   color: Colors.red,
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 15),
//                 child: RaisedButton(
//                   onPressed: _saveScreen,
//                   child: Text("Save Local Image"),
//                 ),
//                 width: 200,
//                 height: 44,
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 15),
//                 child: RaisedButton(
//                   onPressed: _getHttp,
//                   child: Text("Save network image"),
//                 ),
//                 width: 200,
//                 height: 44,
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 15),
//                 child: RaisedButton(
//                   onPressed: _saveVideo,
//                   child: Text("Save network video"),
//                 ),
//                 width: 200,
//                 height: 44,
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 15),
//                 child: RaisedButton(
//                   onPressed: _saveGif,
//                   child: Text("Save Gif to gallery"),
//                 ),
//                 width: 200,
//                 height: 44,
//               ),
//             ],
//           ),
//         ));
//   }

//   _requestPermission() async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage,
//     ].request();

//     final info = statuses[Permission.storage].toString();
//     print(info);
//     _toastInfo(info);
//   }

//   _saveScreen() async {
//     RenderRepaintBoundary boundary =
//         _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//     ui.Image image = await boundary.toImage();
//     ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
//     if (byteData != null) {
//       final result =
//       await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
//       print(result);
//       _toastInfo(result.toString());
//     }
//   }

//   _getHttp() async {
//     var response = await Dio().get(
//         "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
//         options: Options(responseType: ResponseType.bytes));
//     final result = await ImageGallerySaver.saveImage(
//         Uint8List.fromList(response.data),
//         quality: 60,
//         name: "hello");
//     print(result);
//     _toastInfo("$result");
//   }

//   _saveGif() async {
//     var appDocDir = await getTemporaryDirectory();
//     String savePath = appDocDir.path + "/temp.gif";
//     String fileUrl =
//         "https://hyjdoc.oss-cn-beijing.aliyuncs.com/hyj-doc-flutter-demo-run.gif";
//     await Dio().download(fileUrl, savePath);
//     final result = await ImageGallerySaver.saveFile(savePath);
//     print(result);
//     _toastInfo("$result");
//   }

//   _saveVideo() async {
//     var appDocDir = await getTemporaryDirectory();
//     String savePath = appDocDir.path + "/temp.mp4";
//     String fileUrl =
//         "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4";
//     await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
//       print((count / total * 100).toStringAsFixed(0) + "%");
//     });
//     final result = await ImageGallerySaver.saveFile(savePath);
//     print(result);
//     _toastInfo("$result");
//   }

//   _toastInfo(String info) {
//     Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
//   }
// }