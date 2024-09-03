import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:rvcare/controller/myProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'ApiServices/otpApiServices.dart';
import 'Utils/AppConstants.dart';
import 'Utils/Connectivity.dart';
import 'Utils/Global.dart';
import 'Utils/PreferenceHelper.dart';
import 'common/constant.dart';
import 'controller/homescreenAfterlogin.dart';
import 'model/modelLogin.dart';
import 'model/modelotp.dart';
class OTPScreen extends StatefulWidget {
   var otp;
   var  mobile;

   OTPScreen({Key? key, required this.otp,required this.mobile}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  PreferenceHelper prefs = PreferenceHelper();
  late ModelOtp model;
  late ModelLogin modelLogin;
  String otpCode ="";
  @override
  // initState()  {
  //   showToast(widget.otp,
  //       gravity: Toast.BOTTOM, duration: 10);
  //   super.initState();
  // }




  Future<void> redirect() async {
    PreferenceHelper prefs = PreferenceHelper();
    bool isLoggedin =
    await prefs.getPreferenceBoolValue(AppConstants.isLoggedin);
    setState(() {
      if (isLoggedin) {
        //Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  HomeScreenAftLogin();
            },
          ),
        );
      }
    });
  }

  void setPreferenceValues(ModelOtp response) async {
    SharedPreferences logindata = await SharedPreferences.getInstance();
    setState(() {
      logindata.setBool('alreadyLogged', true);
     logindata.setString('accessToken', response.token.toString());
      logindata.setString('userId', response.id.toString());
      logindata.setString('id', response.id.toString());

    });
  }


  otpApiCall() {
    ConnectivityCheck.checkConnection().then((connectionResult) async {
      if (connectionResult) {
        //await progressDialog.show();

        apiFunc();
      } else {
        Toast.show("Please check your internet connection",
        );

        return;
      }
    });
  }
  apiFunc() async {
    try {
      final modelOtp = await OtpApiService.otpApiCall(context, widget.mobile, otpCode);

      if (!mounted) return; // Ensure the widget is still in the tree

      model = modelOtp;
      if (modelOtp.message != null) {

        print(modelOtp.stat);
        setState(() {
          print("modell123");
          Global.shared.accessToken = modelOtp.token ?? '';

          print("AccessToken: ${Global.shared.accessToken}");

          Global.shared.userId = modelOtp.id?.toString() ?? '';
          print("ID: ${Global.shared.userId}");
          Global.shared.id = modelOtp.id?.toString() ?? '';
          if (modelOtp.stat == 1 ) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreenAftLogin();
                },
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MyProfileScreen(userid: modelOtp.id?.toString() ?? '');
                },
              ),
            );
          }
        });

        setPreferenceValues(modelOtp);


      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception('Failed to complete API call');
    }
  }



  Widget build(BuildContext context) {
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
                  child: Text('An OTP has been shared to this number',

                    style: TextStyle(fontWeight: FontWeight.w400,
                      fontSize:13 ,),
                  ),),
                Positioned(
                  top:  size.height * 0.43,
                  left: 140,
                  child: Text(widget.mobile,

                    style: TextStyle(fontWeight: FontWeight.w600,
                      fontSize:13 ,),
                  ),),
               Positioned(top: size.height * 0.48, child: otpBgWidget())

              ],
            ),
          ),
        )
    );
  }
  Widget otpBgWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: size.width,
      color: themeColor,
      child: Column(
        children: [
          OtpTextField(
            enabledBorderColor: const Color(0xFFE0E0E0),
            numberOfFields: 4,
            textStyle: const TextStyle( color:buttoncolor,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
            borderColor:  const Color(0xFFE0E0E0),
            fieldWidth: 45.0,
            focusedBorderColor:  const Color(0xFFE0E0E0),
            showFieldAsBox: true,
            borderRadius: BorderRadius.circular(10),

            onCodeChanged: (String code) {

            },
            onSubmit: (String verificationCode){
              otpCode = verificationCode;

            }, // end onSubmit
          ),
          const SizedBox(height:30 ,),
          GestureDetector(
            onTap: (){
             // loginApiCall();
            },
            child: const Text(
              "Resend OTP",
              style: TextStyle(
                  color:Colors.black,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0
              ),
            ),
          ),
          SizedBox(height:size.height*0.075 ,),
          TextButton(
            onPressed: (){
              otpApiCall();

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
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}
