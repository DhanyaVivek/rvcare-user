import 'package:flutter/material.dart';

import '../common/constant.dart';
import '../loginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: themeColor,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 26,
                color: Colors.black,
              ),
              onPressed: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const HomePageScreen();
                //     },
                //   ),
                // );
              },
            ),
          ),
          // title: const Text(
          //   "My Profile",
          //   style: TextStyle(
          //       color: Colors.black,
          //       fontWeight: FontWeight.w400,
          //       fontSize: 16.0,
          //       fontFamily: "Poppins"),
          // ),

        ),
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                width: size.width,
                color: themeColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height * 0.13,
                        width: size.width * 0.22,
                        child: Center(
                          child: Image.asset(
                            "assets/images/icon.png",
                            height: size.height * 0.13,
                            width: size.width * 0.22,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.black26,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(

                              // controller: name,

                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: const TextStyle(
                                    fontFamily: "Roboto",
                                    color: Colors.black54,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300),
                                fillColor: greyColor,
                                filled: true,
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              maxLength: 30),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            // controller: name,
                              minLines: 4, // any number you need (It works as the rows for the textarea)
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                hintText: "Address",
                                hintStyle: const TextStyle(
                                    fontFamily: "Roboto",
                                    color: Colors.black54,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300),
                                fillColor: greyColor,
                                filled: true,
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            //  keyboardType: TextInputType.text,
                              ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Whatsapp Number',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(

                            // controller: name,

                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                hintText: "+91 |",
                                hintStyle: const TextStyle(
                                    fontFamily: "Roboto",
                                    color: Colors.black54,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300),
                                fillColor: greyColor,
                                filled: true,
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              maxLength: 10),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Landmark',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(

                            // controller: name,

                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                hintText: "Landmark",
                                hintStyle: const TextStyle(
                                    fontFamily: "Roboto",
                                    color: Colors.black54,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300),
                                fillColor: greyColor,
                                filled: true,
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              maxLength: 30),
                        ],
                      ),
                      SizedBox(height: 20,),
                      TextButton(
                        onPressed:() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 45,
                          width: size.width* 0.95,
                          decoration: BoxDecoration(
                            color: buttoncolor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Next",
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
                ))));
  }
}
