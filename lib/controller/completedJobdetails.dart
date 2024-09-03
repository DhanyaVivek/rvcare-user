import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../ApiServices/completedJobDetailsApi.dart';
import '../ApiServices/completedjoblistApi.dart';
import '../Utils/Connectivity.dart';
import '../Utils/Global.dart';
import '../common/constant.dart';
import 'completedJobs.dart';
import 'homescreenAfterlogin.dart';
class CompletedJobDetails extends StatefulWidget {
  final String jobid;
  final String title;
  const CompletedJobDetails({Key? key, required this.jobid, required this.title}) : super(key: key);

  @override
  State<CompletedJobDetails> createState() => _CompletedJobDetailsState();
}

class _CompletedJobDetailsState extends State<CompletedJobDetails> {
  String _typework ='';
  String _date='';
  String _time='';
  String _location='';
  String _address='';
  String _mobile='';
  String _description='';
  @override
  void initState() {
    super.initState();
    completedJobDetailsApiCall();
  }
  completedJobDetailsApiCall() {
    ConnectivityCheck.checkConnection().then((connectionResult) async {
      if (connectionResult){
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
    CompletedDetailsApiService. CompletedDetailsApiCall(context, Global.shared.userId,widget.jobid)
        .then((result) async {
      try {
       // print('object');
        setState(() {
          _typework = result['type_work'].toString();
          _date= result['payment_date'].toString();
          _time= result['payment_time'].toString();
          _location= result['location'].toString();
          _address= result['address'].toString();
          _mobile= result['mobile'].toString();
          _description= result['description'].toString();
          //  print('dddd'+_typework.toString());

        });

        // return _earnings;
      } catch (e) {
        //await progressDialog.hide();
      }
    });
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        centerTitle: true,
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
                    return const CompletedJobScreen();
                  },
                ),
              );
            },
          ),
        ),
        title:  Text(
          widget.title,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              fontFamily: "Poppins"),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,

        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: size.width,
                  height: size.height ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10),

                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(top: 20,left: 10) ,
                            child: Row(
                              children: [
                                Container(
                                  width: 250,height: 20,
                                  // color: Colors.orange,

                                  child: Text('Job Details',style: TextStyle(fontSize: 16,
                                      color: textcolor,
                                      fontWeight: FontWeight.w500),),
                                ),


                              ],
                            ),
                          ),
                          SizedBox(height:10,),

                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 10),
                            child: Divider(
                              height: 10,
                              color: fontcolor,
                            ),
                          ),
                          SizedBox(height: 10),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Type of work',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(

                                // controller: name,
                                  enabled: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    hintText: _typework,
                                    hintStyle: const TextStyle(
                                        fontFamily: "Roboto",
                                        color: Colors.black54,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400),
                                    // fillColor: greyColor,
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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        enabled: false,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300),
                                        decoration: InputDecoration(
                                          hintText: _date,
                                          hintStyle: const TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.black54,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400),
                                          //  fillColor: greyColor,
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
                                        onTap: () async {


                                        },
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10,),
                                  SizedBox(
                                    height: 45,
                                    width: size.width * 0.39,
                                    child: TextFormField(
                                      //controller: nomineeAgeTextController,
                                        enabled: false,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300),
                                        decoration: InputDecoration(
                                          hintText:_time,
                                          hintStyle: const TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.black54,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400),
                                          // fillColor: greyColor,
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
                                        maxLength: 3),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(

                                // controller: name,
                                  enabled: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    hintText: _location,
                                    hintStyle: const TextStyle(
                                        fontFamily: "Roboto",
                                        color: Colors.black54,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400),
                                    //  fillColor: greyColor,
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
                          SizedBox(height: 10,),
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
                                enabled: false,
                                minLines: 4, // any number you need (It works as the rows for the textarea)
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText: _address,
                                  hintStyle: const TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.black54,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400),
                                  //  fillColor: greyColor,
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
                                'Contact Number',
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
                                    hintText: '+91 | $_mobile',
                                    hintStyle: const TextStyle(
                                        fontFamily: "Roboto",
                                        color: Colors.black54,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400),
                                    //  fillColor: greyColor,
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
                                'Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                // controller: name,
                                enabled: false,
                                minLines: 3, // any number you need (It works as the rows for the textarea)
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText: _description,
                                  hintStyle: const TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.black54,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400),
                                  //   fillColor: greyColor,
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
                        ],
                      ),
                    ),
                  ),
                  // Other widget properties like padding, alignment, etc.
                ),

              )
            ],
          ),
        ),

      ),
    );
  }
}
