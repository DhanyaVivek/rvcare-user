import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rvcare/Utils/Global.dart';
import 'package:rvcare/controller/ongoingJobs.dart';
import 'package:rvcare/controller/userdashboard.dart';

import '../common/constant.dart';

import 'completedJobs.dart';
import 'dashboard.dart';
import 'estimateScreen.dart';
import 'jobrequest.dart';
import 'myProfileScreen.dart';
import 'notificationScreen.dart';
class HomeScreenAftLogin extends StatefulWidget {

  const HomeScreenAftLogin({Key? key}) : super(key: key);

  @override
  State<HomeScreenAftLogin> createState() => _HomeScreenAftLoginState();
}

class _HomeScreenAftLoginState extends State<HomeScreenAftLogin> {
  @override

  int _currentIndex = 0;
  int i = 0;
  final List<String> imagesList = [
    'assets/images/slider11.png',
    'assets/images/slider11.png',
    'assets/images/slider11.png'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> _widgetOptions = <Widget>[
       UserDashboard(userid:Global.shared.id),
      const NotificationScreen(),
       MyProfileScreen(userid:Global.shared.id)
    ];
    return Scaffold(
      backgroundColor:themeColor,

      bottomNavigationBar: bottomNav(),
      body: Center(child: _widgetOptions.elementAt(i)),


    );
  }

Widget bottomNav() {
  return BottomNavigationBar(

    onTap: (index) {
      setState(() {
        i = index;
        print(i);
      });
    },

      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedLabelStyle: const TextStyle(color: selectColor),
      unselectedLabelStyle: const TextStyle(color: selectColor),

      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),

            child: Image.asset(
              i == 0 ? "assets/images/Home.png" : "assets/images/Homeimg.png",

              // color: themeColor,
              height: 22,
              width: 22,
            ),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset(
              i == 1
                  ? "assets/images/notifiSelect.png"
                  : "assets/images/Notification.png",

              //  color: themeColor,
              height: 22,
              width: 22,
            ),
          ),
          label: "Notification",
        ),

        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset(
              i == 2
                  ? "assets/images/ProfileSelect.png"
                  : "assets/images/Profile.png",

              //   color: themeColor,
              height: 22,
              width: 22,
            ),
          ),
          label: "My Profile",
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: i,
      backgroundColor: Colors.white,
      iconSize: 30,
      //onTap: _onItemTapped,
      selectedItemColor: selectColor,
      unselectedItemColor: Colors.grey[500],
      elevation: 20);
}
}