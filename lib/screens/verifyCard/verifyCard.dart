import 'package:flutter/material.dart';
import 'package:peer_money/models/appTextSetting.dart';

class VerifyCard {
  Card verifyCard(
      String image, String title, Color color, String text, String txtBtn,
      {VoidCallback? press}) {
    return Card(
      color: const Color(0xFFF5F5F5),
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset('assets/images/bg-verify.png'),
                  Image.asset(image)
                ],
              )),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 12),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontFamily: AppTextSetting.APP_FONT,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: color),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 7, bottom: 5.0, right: 5.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 40,
                  padding:
                      const EdgeInsets.only(left: 7, bottom: 5.0, right: 5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        // backgroundColor: MaterialStatePropertyAll(
                        //   AppTextSetting.COLOR_PRIMARY,
                        // ),
                      ),
                      onPressed: press,
                      child: Text(
                        txtBtn,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: AppTextSetting.APP_FONT,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card verifyCardKYC(String image, String title, Color color, String text) {
    return Card(
      elevation: 8.0,
      color: const Color(0xFFF5F5F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset('assets/images/bg-verify.png'),
                  Image.asset(image)
                ],
              )),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 12),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontFamily: AppTextSetting.APP_FONT,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: color),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 7, bottom: 5.0, right: 5.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
