import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/testCode/donutPieChart.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreenDetial extends StatefulWidget {
  static const String id = "HomeScreenDetial";
  final void Function() onInit;
  final List<charts.Series>? seriesList;
  final bool? animate;
  const HomeScreenDetial(
      {Key? key, required this.onInit, this.seriesList, this.animate})
      : super(key: key);

  @override
  State<HomeScreenDetial> createState() => _HomeScreenDetialState();
}

class _HomeScreenDetialState extends State<HomeScreenDetial> {
  bool pressed = false;
  bool isDarkMode = false;
  bool verify = false;
  late double heightScreen;
  late double widthScreen;

//  double

  @override
  void initState() {
    super.initState();
    verify = false;
    print(verify);
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    heightScreen = MediaQuery.of(context).size.height;
    widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
        child: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: AppTextSetting.COLOR_PRIMARY,
            height: widthScreen * 0.5,
            // margin: const EdgeInsets.all(10),
            child: Container(
              margin: const EdgeInsets.only(top: 30, left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hi',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Simpsom',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Image.asset('assets/images/Vector-home.png',scale: 10,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/haed-home.png',
              width: 300.0,
              height: 190.0,
              fit: BoxFit.cover,
            ),
          ),
          if (verify == false)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: heightScreen * 0.12),
                width: widthScreen * 0.9,
                height: widthScreen * 0.38,
                child: Card(
                  color: const Color(0xFFF5F5F5),
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        // margin: const EdgeInsets.only(left: 10),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: ExactAssetImage(
                                      'assets/images/bg-verify.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Image.asset('assets/images/verify-1.jpg'),
                            )
                          ],
                        ),
                      ),
                      //  child: Image.asset('assets/images/verify-1.jpg')),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 6, top: 12),
                                child: Text(
                                  'Verify You Identify',
                                  style: TextStyle(
                                      fontFamily: AppTextSetting.APP_FONT,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1783DC)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 7, bottom: 5.0, right: 5.0),
                                child: Text(
                                  'Complete Verification to gain\nfull access to your Peer account',
                                  style: TextStyle(
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              InkWell(
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
                                      'Verify Me',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                  onTap: () {
                                      setState(() {
                                        verify = true;
                                        print(verify);
                                      });

                                      widget.onInit();
                                    },
                              ),
                              /* Container(
                                width: 150,
                                height: 40,
                                padding: const EdgeInsets.only(
                                    left: 7, bottom: 5.0, right: 5.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      // backgroundColor: MaterialStateProperty(
                                      //   AppTextSetting.COLOR_PRIMARY,
                                      // ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        verify = true;
                                        print(verify);
                                      });

                                      widget.onInit();
                                    },
                                    child: const Text(
                                      'Verify Me',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppTextSetting.APP_FONT,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (verify == true) const SizedBox(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                  top: verify == true
                      ? heightScreen * 0.08
                      : heightScreen * 0.3),
              width: widthScreen * 0.9,
              height: widthScreen * 0.65,
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Total Assets',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                ' 0.00',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 80),
                          const SizedBox(
                              height: 50,
                              child: VerticalDivider(color: Colors.grey)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Loan',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                ' 0.00',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'LTV',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 3),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: AppTextSetting.COLOR_PRIMARY,
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(1),
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.question_mark,
                                    size: 13,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            '70%',
                            style: TextStyle(
                              color: AppTextSetting.COLOR_GREEN,
                              fontFamily: AppTextSetting.APP_FONT,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Lock with PEER',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: AppTextSetting.APP_FONT,
                              // fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                pressed = !pressed;
                                print(pressed);
                              });
                            },
                            icon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 4, right: 4, top: 0),
                                child: pressed == true
                                    ? const FaIcon(
                                        FontAwesomeIcons.toggleOn,
                                        color: AppTextSetting.COLOR_PRIMARY,
                                        size: 30,
                                      )
                                    : const FaIcon(
                                        FontAwesomeIcons.toggleOff,
                                        color: Colors.grey,
                                        size: 30,
                                      )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Limit Used :',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            ' 90%',
                            style: TextStyle(
                              color: AppTextSetting.COLOR_GREEN,
                              fontFamily: AppTextSetting.APP_FONT,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      //const SizedBox(height: 20),
                      Container(
                        width: widthScreen,
                        height: 15,
                        margin: const EdgeInsets.all(10),
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.9,
                            valueColor: AlwaysStoppedAnimation(
                                AppTextSetting.COLOR_GREEN),
                            backgroundColor: AppTextSetting.COLOR_LIGHT_GREY,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'You can load limit :',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '฿0.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppTextSetting.APP_FONT,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(
                  top:
                      verify == true ? heightScreen * 0.4 : heightScreen * 0.62,
                  left: 26),
              child: const Text(
                'Your Asset',
                style: TextStyle(
                  fontFamily: AppTextSetting.APP_FONT,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (pressed == false)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    top: verify == true
                        ? heightScreen * 0.45
                        : heightScreen * 0.65),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/empty-assets-illus.png'),
                    const Text(
                      'Empty Assets',
                      style: TextStyle(
                        fontFamily: AppTextSetting.APP_FONT,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: AppTextSetting.COLOR_LIGHT_GREY,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          if (pressed == true)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    top: verify == true
                        ? heightScreen * 0.45
                        : heightScreen * 0.65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: widthScreen,
                          height: 250,
                          child: DonutPieChart(
                            _createSampleData(),
                            animate: false,
                          ),
                        )),
                  ],
                ),
              ),
            ),
        ],
      ),
    ));
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 25),
      LinearSales(1, 25),
      LinearSales(2, 15),
      LinearSales(3, 10),
      LinearSales(4, 5),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}
