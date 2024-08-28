import 'package:flutter/material.dart';
import 'package:rvcare/controller/userdashboard.dart';
import 'package:rvcare/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../ApiServices/profileApiServices.dart';
import '../Utils/Connectivity.dart';
import '../Utils/Global.dart';
import '../common/constant.dart';
import '../loginScreen.dart';
import 'editprofile.dart';
import 'notificationScreen.dart';
class MyProfileScreen extends StatefulWidget {
final String userid;
  const MyProfileScreen({Key? key, required this.userid,}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String _name = '';
  String _mobile = "";
  int i = 0;
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }
  apiCall() {
    ConnectivityCheck.checkConnection().then((connectionResult) async {
      if (connectionResult) {
        //await progressDialog.show();
        apiFun();
      } else {
        Toast.show("Please check your internet connection", duration: Toast.lengthShort, gravity:  Toast.bottom);
        return;
      }
    });
  }
  apiFun() {
   // print('abcd');
    MyProfileApiService.myProfileApiCall(context).then((modelUpdateProfile) async {
      try {
       // print("jkjjkjjkjkjk " + modelUpdateProfile.toString());
        setState(() {
          _name = modelUpdateProfile!.name.toString();
          _mobile = modelUpdateProfile!.mobile.toString();
          //  print('dddd'+_name.toString());

        });
      }
      catch (e) {
        print(e);
        throw Exception('Failed');
      }

    });
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white,

        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              fontFamily: "Poppins"),
        ),
      ),
     // bottomNavigationBar: bottomNav(),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 60,
                left: 120,
                child:  Image.asset(
                  "assets/images/profileicon.png",
                  height: size.height * 0.17,
                  width: size.width * 0.35,
                  fit: BoxFit.fill,
                ),),
            Positioned(
              top: 200,
                left: 140,
                child: Text(_name,style: TextStyle(fontFamily:"Roboto",
                fontSize: 24,fontWeight: FontWeight.w500),)),
            Positioned(
                top: 240,
                left: 120,
                child: Text( '+91 $_mobile',style: TextStyle(fontFamily:"Roboto",
                    fontSize: 15,fontWeight: FontWeight.w400,color: fontcolor),)),

            Positioned(top:270,
                left:105,
                child:  TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return  EditProfileScreen(userid:widget.userid);
                        },
                      ),
                    );


                  },
                  child: Container(
                    height: 45,
                    width: size.width* 0.4,
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 0.9,
                          color: buttoncolor
                      ),
                    ),
                    child:  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const  Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto",
                              color: buttoncolor,
                              fontSize: 16,
                            ),

                          ),
                          SizedBox(width:8,),
                          Image.asset(
                            'assets/images/Edit.png',
                            fit: BoxFit.cover,width: 18,height: 23,
                            color: buttoncolor,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Positioned(top:540,
                left:50,
                child:  TextButton(
                  onPressed: () async{


                      SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.clear();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) =>  LoginScreen()),
                            (Route<dynamic> route) => false,
                      );


                  },
                  child: Container(
                    height: 45,
                    width: size.width* 0.7,
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 0.9,
                          color: buttoncolor
                      ),
                    ),
                    child:  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const  Text(
                            "Logout",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              color: messagecolor,
                              fontSize: 15,
                            ),

                          ),


                          SizedBox(width:8,),
                          Icon(
                            Icons.logout,
                            size: 20,
                            color: messagecolor,
                          ),
                          // Image.asset(
                          //   'assets/images/Edit.png',
                          //   fit: BoxFit.cover,width: 18,height: 23,
                          //   color: buttoncolor,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
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
