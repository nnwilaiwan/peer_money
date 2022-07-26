import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/getAction.dart';
import 'package:peer_money/screens/widgets/loanAmount/loanConfirm.dart';

class LoanAmountScreen extends StatefulWidget {
  static const String id = "LoanAmountScreen";
  final void Function() onInit;
  const LoanAmountScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<LoanAmountScreen> createState() => _LoanAmountScreenState();
}

class _LoanAmountScreenState extends State<LoanAmountScreen> {
  bool pressed = false;
  bool btnAuto = true;
  bool btnManual = false;
  bool isvisible = false;

  String? _selectedValue;
  String? _selectChooseCollateral;

  final loanamount = TextEditingController();

  @override
  void initState() {
    loanamount.text = '100,000.00';
    _selectedValue = '1';
    _selectChooseCollateral = '1';
    btnAuto = true;
    super.initState();
  }

  Container dropdownLoanTerm(double widthScreen, double heightScreen) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1,
          color: const Color(0xFFD6D6D6),
        ),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          items: [
            for (var item in AppTextSetting.LOAN_TREM) item,
          ].map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item['id'].toString(),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: widthScreen * 0.8,
                            height: widthScreen * 0.08,
                            padding: const EdgeInsets.all(2),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Center(
                                child: Text(item['name'],
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedValue = value! as String?;
            });
            print('----- value ------');
            print(_selectedValue);
          },
          hint: const Text(
            "",
            style: TextStyle(
              fontFamily: AppTextSetting.APP_FONT,
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          value: _selectedValue,
        ),
      ),
    );
  }

  Container dropdownChooseCollateral(double widthScreen, double heightScreen) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const ImageIcon(
            AssetImage("assets/icons/arrow_downward.png"),
            color: Color(0xFF09121F),
            size: 24,
          ),
          style: const TextStyle(color: AppTextSetting.COLOR_PRIMARY),
          items: [
            for (var item in AppTextSetting.SELECT_COLLATERAL) item,
          ].map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item['id'].toString(),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // width: widthScreen * 0.8,
                            // height: widthScreen * 0.08,
                            padding: const EdgeInsets.all(2),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Center(
                                child: Text(item['name'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Color(0xFF09121F),
                                        fontSize: 16,
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectChooseCollateral = value.toString();
            });
            print('----- value ------');
            print(_selectChooseCollateral);
          },
          hint: const Text(
            "",
            style: TextStyle(
              fontFamily: AppTextSetting.APP_FONT,
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          value: _selectChooseCollateral,
        ),
      ),
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
              backgroundColor: AppTextSetting.COLOR_PRIMARY,
              centerTitle: true,
              title: const Text('Enter Loan Amount',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),),
            ),
            body: Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
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
                    const Text(
                      'Loan Amount',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: AppTextSetting.APP_FONT,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 47,
                      margin: const EdgeInsets.only(right: 8),
                      child: TextField(
                        controller: loanamount,
                        cursorColor: const Color(0xFFD6D6D6),
                        decoration: const InputDecoration(
                          hintText: '0.0',
                          suffixText: 'THB',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                              color: Color(0xFFD6D6D6),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                              color: Color(0xFFD6D6D6),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD6D6D6),
                            ),
                          ),
                          suffixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Loan Term',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: AppTextSetting.APP_FONT,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    dropdownLoanTerm(widthScreen, heightScreen),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.only(right: 15, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Monthly Interest',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF767676),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '1,500.00 THB',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF363636),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Total Interest',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF767676),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '4,500.00 THB',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF363636),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Text(
                          'Collateral',
                          style: TextStyle(
                            color: Color(0xFF363636),
                            fontFamily: AppTextSetting.APP_FONT,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
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
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              btnManual = false;
                              btnAuto = true;
                              isvisible = false;
                              print('auto');
                            });
                          },
                          child: Container(
                            width: widthScreen * 0.3,
                            height: 45,
                            decoration: BoxDecoration(
                              color: btnAuto == true
                                  ? Colors.white
                                  : const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: btnAuto == true
                                    ? const Color(0xFFF2A21E)
                                    : const Color(0xFFD6D6D6),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Auto',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: btnAuto == true
                                        ? const Color(0xFFF2A21E)
                                        : const Color(0xFF767676),
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {
                            setState(() {
                              btnAuto = false;
                              btnManual = true;
                              isvisible = true;
                              print('manual');
                            });
                          },
                          child: Container(
                            width: widthScreen * 0.3,
                            height: 45,
                            decoration: BoxDecoration(
                              color: btnManual == true
                                  ? Colors.white
                                  : const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: btnManual == true
                                    ? const Color(0xFFF2A21E)
                                    : const Color(0xFFD6D6D6),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Manual',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: btnManual == true
                                        ? const Color(0xFFF2A21E)
                                        : const Color(0xFF767676),
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Visibility(
                      visible: isvisible,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Choose Collateral',
                                style: TextStyle(
                                    color: Color(0xFF363636),
                                    fontSize: 12,
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Balance : 10 ETH',
                                style: TextStyle(
                                    color: Color(0xFF767676),
                                    fontSize: 12,
                                    fontFamily: AppTextSetting.APP_FONT,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: widthScreen,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xFFD6D6D6),
                                )),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                            'assets/icons/eth-assets.png'),
                                        const SizedBox(width: 10),
                                        dropdownChooseCollateral(
                                            widthScreen, heightScreen),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Text(
                                          '5.36 ETH',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF363636),
                                          ),
                                        ),
                                        Text(
                                          '~ 200,000 THB',
                                          style: TextStyle(
                                              color: Color(0xFF767676),
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTextSetting.APP_FONT,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoanConfirmScreen(
                                    onInit: () {
                                      StoreProvider.of<AppState>(context)
                                          .dispatch(getLoginAction);
                                    },
                                  )),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: widthScreen,
                        height: 40,
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
                            'Continue',
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
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
