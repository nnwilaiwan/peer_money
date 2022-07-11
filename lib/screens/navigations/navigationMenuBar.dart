import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peer_money/controllers/baseController.dart';
import 'package:peer_money/models/appTextSetting.dart';
import 'package:peer_money/models/screenIndex.dart';

class NavigationMenuBar {
  AppBar mainAppBar(BuildContext context, String title) {
    return AppBar(
// status bar color
      automaticallyImplyLeading: false,
      centerTitle: false,
      brightness: Brightness.light,
      title: Container(
        alignment: Alignment.topLeft,
        // width: 40,
        child: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/Peer_logo.png',
          width: 25,
          height: 25,),
        ),
      ),
      backgroundColor: AppTextSetting.COLOR_PRIMARY,
      actions: [
        Container(
          alignment: Alignment.centerRight,
          // width: 40,
          margin: const EdgeInsets.only(right: 20),
          child: InkWell(
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/bell.png'))
                // FaIcon(
                //   FontAwesomeIcons.bell,
                //   size: 30,
                //   color: Colors.white,
                // ),
                // if (AppTextSetting.COUNTNONTIFY != 0)
                //   Container(
                //     alignment: Alignment.center,
                //     decoration:  BoxDecoration(
                //       color: Colors.red,
                //       borderRadius:  BorderRadius.circular(10),
                //     ),
                //     height: 14,
                //     width: 14,
                //     child: Text(
                //       AppTextSetting.COUNTNONTIFY.toString(),
                //       style: const TextStyle(color: Colors.white, fontSize: 9),
                //     ),
                //   ),
              ],
            ),
            onTap: () async {
              BaseController baseController = new BaseController();

              // SharedPreferences prefs = await SharedPreferences.getInstance();

              // print(prefs.getString('token'));
              // print(prefs.getString('employeeid'));

              // baseController.launchMapsUrl(13.711484853837971,
              //     100.35458576930706, 13.713091589038724, 100.40805356686879);
              //baseController.navigateTo(13.713091589038724, 100.40805356686879);
              //launchMap();
              //
              //navigateTo(location.lat, location.lng);
              // int sum;
              // sum = (1 + 60) - 41;
              // print(sum);

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => MapSample()));

              // String sum = "12345";
              // print(sum.substring(0, 3));
              // await LoginController().logOut(context);
            },
          ),
        ),
      ],
    );
  }

  AppBar mainAppBarAssest(BuildContext context, String title) {
    return AppBar(
// status bar color
      automaticallyImplyLeading: false,
      centerTitle: true,
      brightness: Brightness.light,
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: AppTextSetting.APP_FONT,
            fontWeight: FontWeight.w700),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(
          'assets/icons/Peer_logo.png',
          width: 25,
          height: 25,
        ),
      ),

      backgroundColor: AppTextSetting.COLOR_PRIMARY,
      actions: [
        Container(
          // alignment: Alignment.centerRight,
          // width: 40,
          // margin: const EdgeInsets.only(right: 20),
          child: InkWell(
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/bell.png'),
                ),
              ],
            ),
            onTap: () async {
              BaseController baseController = new BaseController();
            },
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem2(String img1,
      String img2, int val, ScreenIndex screenIndex, String title) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: screenIndex.index == val
          ? Container(
              margin: const EdgeInsets.only(left: 2, right: 2),
              child: Image.asset(img1, color: AppTextSetting.COLOR_PRIMARY),
            )
          : Container(
              margin: const EdgeInsets.only(left: 2, right: 2),
              child: Image.asset(img2, color: const Color(0xFF767676)),
            ),
      label: title,
    );
  }

  /*BottomNavigationBarItem buildBottomNavigationBarItem(IconData icon1,
      IconData icon2, int val, ScreenIndex screenIndex, String title) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: screenIndex.index == val
          ? Container(
              margin: const EdgeInsets.only(left: 2, right: 2),
              child: FaIcon(
                icon1,
                size: 30,
              ),
            )
          : Container(
              margin: const EdgeInsets.only(left: 2, right: 2),
              child: FaIcon(
                icon2,
                size: 30,
              ),
            ),
      label: title,

      // Container(
      //   child: Text(
      //     title,
      //     style: const TextStyle(
      //         fontFamily: AppTextSetting.APP_FONT,
      //         fontSize: 18,
      //         fontWeight: FontWeight.bold),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
    );
  }*/

}
