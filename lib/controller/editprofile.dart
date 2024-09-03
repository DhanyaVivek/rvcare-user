import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../ApiServices/profileApiServices.dart';
import '../ApiServices/profileupdateApi.dart';
import '../Utils/Connectivity.dart';
import '../common/constant.dart';
import '../model/modelprofiledetails.dart';
import '../model/modelupdateprofile.dart';
import 'homescreenAfterlogin.dart';
import 'myProfileScreen.dart';

class EditProfileScreen extends StatefulWidget {
  final String userid;
  const EditProfileScreen({Key? key, required this.userid,}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController landmark = TextEditingController();

  late ModelUpdateProfile modelUpdateProfile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }
  apiCall() {
    print('abcd');

    MyProfileApiService.myProfileApiCall(context).then((value) {
      if (value?.id != '') {

        setState(() {
          name.text = value!.name.toString();
          mobile.text=value!.mobile.toString();
          address.text =value!.address.toString();
          landmark.text = value!.landmark.toString();

        });
      } else {
        Toast.show(value!.message.toString());
      }
    });
  }
  UpdateProfileapiCall() {
    ConnectivityCheck.checkConnection().then((connectionResult) async {
      if (connectionResult) {
        //await progressDialog.show();
        profileapiCall();
      } else {
        Toast.show("Please check your internet connection", duration: Toast.lengthShort, gravity:  Toast.bottom);
        return;
      }
    });
  }
  void profileapiCall() {
    print(name.text,);

    print(mobile.text,);
    print(landmark.text);
    print(address.text,);

    ProfileUpdateApiServices.UpdateProfileApiCall(
      context:context,
      userid: widget.userid,
      name:name.text,
      mobile:mobile.text,
      address:address.text,
      landmark:landmark.text,

    ).then((modelUpdateProfile) async {
      try {
        print("jkjjkjjkjkjk " + modelUpdateProfile.toString());
        modelUpdateProfile;
        if ((modelUpdateProfile) != '') {
          Toast.show("Profile Updated sucessfully", duration: Toast.lengthShort, gravity:  Toast.bottom);


          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomeScreenAftLogin();
              },
            ),
          );
          Toast.show((modelUpdateProfile.message.toString()), duration: Toast.lengthShort, gravity:  Toast.bottom);

        }else {
          Toast.show('Something went wrong', duration: Toast.lengthShort, gravity:  Toast.bottom);
        }
        Toast.show((modelUpdateProfile.message.toString()), duration: Toast.lengthShort, gravity:  Toast.bottom);

      } catch (e) {
        print(e);
        throw Exception('Failed');
      }
    });
  }

  Widget  build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 26,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                  //  return  MyPr ofileScreen(userid: widget.userid,);
                    return HomeScreenAftLogin();
                  },
                ),
              );
            },
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              fontFamily: "Poppins"),
        ),
      ),
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                width: size.width,
                color: themeColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


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
                              controller: name,

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
                             controller: address,
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

                             controller: mobile,

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
                              controller: landmark,

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
                      SizedBox(height: 70,),
                      TextButton(
                        onPressed: (){
                          UpdateProfileapiCall();

                        },
                        child: Container(
                          height: 45,
                          width: size.width* 1.0,
                          decoration: BoxDecoration(
                            color: profsavebutton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Save",
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
                )))

    );
  }
}


