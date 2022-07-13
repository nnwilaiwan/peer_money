import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:peer_money/models/appTextSetting.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isInputTxt = false;
  bool value = false;
  bool scroll = false;
  final ScrollController _scrollController = ScrollController();
  // final _scrollController = ScrollController(initialScrollOffset: 0.0);

  @override
  void initState() {
    setState(() {
      value = false;
      _scrollController.addListener(() {
        //listener
        // print(_scrollController.offset);
        setState(() {
          if (_scrollController.offset ==
              _scrollController.position.maxScrollExtent) {
            scroll = true;
          }
          //update state
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: heightScreen,
        width: widthScreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "Terms and Conditions",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withBlue(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "Terms and Conditions application peer moneyversion 1.0 release  on  10 Jun 2022",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withBlue(40),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              height: 400,
              margin: const EdgeInsets.all(10),
              child: Scrollbar(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Text(
                    'Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withBlue(40),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 6, left: 4, bottom: 5),
              child: Row(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor:
                          scroll == false ? Colors.transparent : Colors.grey,
                    ),
                    child: Checkbox(
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                          isInputTxt = true;
                        });
                      },
                    ),
                  ),
                  Text(
                    "I agree with this terms and conditions \nagreements.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withBlue(40),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            ButtonNext(context),
          ],
        ),
      ),
    );
  }

  Widget ButtonNext(BuildContext context) {
    return TextButton(
        onPressed: () {
          // if (isInputTxt == true) {
          //   MaterialPageRoute route =
          //       MaterialPageRoute(builder: (context) => PrivacyAndPolicyPage());
          //   Navigator.push(context, route);
          // }
        },
        child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            color: isInputTxt == true
                ? Colors.amber
                : const Color.fromARGB(255, 235, 235, 235),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 18,
                offset: const Offset(0, 8), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            "Continue",
            style: TextStyle(
                color: isInputTxt == true
                    ? Colors.white
                    : const Color.fromARGB(255, 213, 213, 213),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
