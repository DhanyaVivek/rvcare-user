import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiServices/LoginApiServices.dart';
import 'Utils/AppConstants.dart';
import 'Utils/Connectivity.dart';
import 'Utils/Global.dart';
import 'common/constant.dart';
import 'model/modelLogin.dart';
import 'otpScreen.dart';
import 'package:toast/toast.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var mobileTextController = TextEditingController();
  var deviceid="abcd";
  @override
  final GlobalKey<FormState> _formKey = GlobalKey();
  dynamic _mob = '';
  late  ModelLogin model;
  dynamic _mobile ='';
  String title = '';

  // deviceInfo() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //   return androidInfo.id;
  // }

  bool validateMobile(String value) {
    String pattern = r'^[6-9]\d{9}$';

    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return true;
    }
    return true;
  }

  loginApiCall() {
    ConnectivityCheck.checkConnection().then((connectionResult) async {
      if (connectionResult) {
        print('hhhhhhhh');
        //await progressDialog.show();
        apiFunc();
      } else {
        Toast.show("Please check your internet connection",
        );

        return;
      }
    });
  }

  apiFunc() {
    LoginApiService.loginApiCall(
        context, mobileTextController.text,deviceid)
        .then((modelLogin) async {
      try {
       // print('dddd');

        // showToast(modelLogin.message.toString(),
        //     gravity: Toast.bottom, duration: 2);
        model = modelLogin;

        // progressDialog.hide();
        if (modelLogin.status!='') {
      //    print(mobileTextController.text);
          print(modelLogin.userData?.otp);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(AppConstants.mobile,mobileTextController.text.toString());
          final String? mobile = prefs.getString(AppConstants.mobile);
         // print(mobile);
          setState(() {
            _mobile = mobile;
           // print(mobile);
            Global.shared.mobile = _mobile;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return  OTPScreen(
                    otp: modelLogin.userData?.otp,
                    mobile: _mobile,
                  );
                },
              ),
            );
          });
        }
        // await progressDialog.hide();
        //Toast.show((modelLogin.status),
      } catch (e) {
        //await progressDialog.hide();
      }
    });
  }

  Widget build(BuildContext context) {
    ToastContext().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:themeColor,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            color: themeColor,

            child: Stack(
              children: [
                Positioned(
                  top: size.height*0.1,
                  child: Container(
                    width: size.width,
                    color: themeColor,
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/icon.png",
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 45.0,
                          ),
                          const Text(
                            "Login Or Sign up",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,right: 18),
                            child: Divider(
                              height: 2,
                              color: Colors.black26,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top:  size.height * 0.4,
                  left: 70,
                    child: Text('Enter your phone number to continue',

                      style: TextStyle(fontWeight: FontWeight.w400,
                      fontSize:13 ,),
                ),),
                Positioned(top: size.height * 0.48, child: loginWidget())

              ],
            ),
          ),
        )
    );
  }
  Widget loginWidget() {
    Size size = MediaQuery.of(context).size;
    return Form(
      key:
      _formKey,
      child: Container(
        height: size.height * 0.45,
        width: size.width,
       // color: Colors.greenAccent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Container(
                  width: 35,
                  color: Colors.transparent,
                  child: TextFormField(
                    enabled: false,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      helperText: "+91 ",
                      hintText: "+91",
                      hintStyle: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,

                      ),
                      fillColor: textboxfillcolor,
                      contentPadding: EdgeInsets.all(0.0),
                      isDense: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:themeColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: themeColor),
                      ),
                      disabledBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(color: themeColor),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: themeColor),
                      ),

                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "error";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Image.asset(
                      "assets/images/seperator.png",height: 22,width: 5,),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Container(
                  width: 110,
                  color: Colors.transparent,
                  child: TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    expands: false,
                    maxLines: 1,
                   controller: mobileTextController,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                    ),

                    decoration:  const InputDecoration(
                      helperText: ' ',
                      counterText: '',
                      contentPadding: EdgeInsets.all(0.0),
                      isDense: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:selectColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:selectColor),
                      ),
                      border:  UnderlineInputBorder(
                        borderSide: BorderSide(color:selectColor),
                      ),
                      errorBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),

                    ),

                    validator: (value) {
                      String pattern =r'^[6-9]\d{9}$';

                      // RegExp regExp = RegExp(pattern);
                      // if (value.isEmpty) {
                      //   return 'Please enter mobile number';
                      // }
                      // else if (!regExp.hasMatch(value)) {
                      //   return 'Please enter valid mobile number';
                      // }
                      _mob = value;
                      return null;
                    },
                    // onChanged: (value) {
                    //   setState(() {
                    //     _mob = value;
                    //     _formKey.currentState.validate();
                    //   });
                    // },
                  ),
                )
              ],
            ),

           // Text(isError?"Enter valid number":""),

            SizedBox(height:size.height*0.05 ,),
            TextButton(
              onPressed: (){
                if (mobileTextController.text == '') {
                  setState(() {
                    title = 'Please enter mobile number';
                  });
                }
                else {
                  loginApiCall();
                }

              },
              child: Container(
                height: 45,
                width: size.width*0.8,
                decoration: BoxDecoration(
                  color: buttoncolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                      color: Colors.white,
                      fontSize: 16,
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
