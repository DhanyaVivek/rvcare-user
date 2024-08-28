import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rvcare/controller/homescreenAfterlogin.dart';
import 'package:toast/toast.dart';

import '../ApiServices/ongoingJobDetailsApi.dart';
import '../ApiServices/updatejobdetailsApi.dart';
import '../Utils/Connectivity.dart';
import '../Utils/Global.dart';
import '../common/constant.dart';
import '../model/modelRequestservice.dart';
import 'jobdetailsScreen.dart';

class JobRequestEditScreen extends StatefulWidget {
 final String userid;
 final String jobid;
  const JobRequestEditScreen({Key? key, required this.userid,required this.jobid}) : super(key: key);

  @override
  State<JobRequestEditScreen> createState() => _JobRequestEditScreenState();
}

class _JobRequestEditScreenState extends State<JobRequestEditScreen> {

  final TextEditingController typework = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController time= TextEditingController();
  final TextEditingController timesection= TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController description = TextEditingController();
  late ModelRequestservice modelRequestservice;


  String dateFormat = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OngoingJobDetailsApiCall();
  }
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        time.text = picked.format(context).split(' ')[0];
        timesection.text = picked.format(context).split(' ')[1];
      });
    }
  }
  OngoingJobDetailsApiCall() {
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
    OngoingDetailsApiService.OngoingDetailsApiCall(context, Global.shared.userId,widget.jobid)
        .then((result) async {
      try {
       // print('object');
        setState(() {


          typework.text  = result['type_work'].toString();
         // print(typework.text);
          date.text= result['date'].toString();
          time.text= result['time'].toString();
          timesection.text= result['time_section'].toString();
          location.text= result['location'].toString();
          address.text= result['address'].toString();
          mobile.text= result['mobile'].toString();
          description.text= result['description'].toString();
          //  print('dddd'+_typework.toString());

        });

        // return _earnings;
      } catch (e) {
        //await progressDialog.hide();
      }
    });
  }

 UpdateJobdetailsapiCall() {
   // var typework;
    print(typework.text,);

   UpdateJobDetailsApiServices.UpdatejobdetlApiCall(
      context:context,
      userid: widget.userid,
      jobid:widget.jobid,
      typework:typework.text,
      date:date.text,
      time:time.text,
      section:timesection.text,
      mobile:mobile.text,
      address:address.text,
      location:location.text,
      description:description.text,

    ).then((modelRequestservice) async {
      try {
        print("jkjjkjjkjkjk " + modelRequestservice.toString());
        modelRequestservice;
        if ((modelRequestservice) != '') {
          Toast.show("Profile Updated sucessfully", duration: Toast.lengthShort, gravity:  Toast.bottom);


          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
               return JobDetailsScreen(jobid: widget.jobid,title:typework.text);
              },
            ),
          );
          Toast.show((modelRequestservice.message.toString()), duration: Toast.lengthShort, gravity:  Toast.bottom);

        }else {
          Toast.show('Something went wrong', duration: Toast.lengthShort, gravity:  Toast.bottom);
        }
        Toast.show((modelRequestservice.message.toString()), duration: Toast.lengthShort, gravity:  Toast.bottom);

      } catch (e) {
        print(e);
        throw Exception('Failed');
      }
    });
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          //  centerTitle: true,
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreenAftLogin();
                    },
                  ),
                );
              },
            ),
          ),
          title: const Text(
            "Edit",
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
            color: themeColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.1,
                      width: size.width,
                      color: messagebox,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.035,
                            width: size.width * 0.06,
                            padding: EdgeInsets.only(left: 10,top: 15),
                            //color: Colors.green,
                            child: Icon(
                              Icons.info_outlined,
                              size: 24,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.only(left: 15, right: 25),
                              child: const Center(
                                child: Text(
                                  'We are dedicated to providing eletrical services.'
                                  'To ensure top-quality service,kindly request jobs within this category. ',
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 11,
                                    color: Color(0xffFF7A00),
                                    height: 1.3,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                  maxLines: 3, // Limit the text to 2 lines
                                  //   overflow: TextOverflow.ellipsis, // Use ellipsis (...) for overflow
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Type of work',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(

                             controller: typework,

                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              hintText: "WorkType",
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
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.39,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 52,
                                child: TextFormField(
                                   controller: date,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300),
                                  decoration: InputDecoration(
                                    hintText: "DD/MM/YYYY",
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
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context, initialDate: DateTime.now(),
                                      firstDate: DateTime(1950), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime.now(),
                                    );

                                    if(pickedDate != null ){
                                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implemen t different kind of Date Format here according to your requirement

                                      setState(() {
                                        date.text = formattedDate; //set output date to TextField value.
                                      });
                                    }else{
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:size.width * 0.22,
                                  height: 53,
                                  child: TextFormField(
                                    controller: time,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300),
                                    decoration: InputDecoration(
                                    //  hintText: "00:00 ",
                                      hintStyle: const TextStyle(
                                          fontFamily: "Roboto",
                                          color: Colors.black54,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300),
                                      fillColor: greyColor,
                                      filled: true,
                                      counterText: "",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    maxLength:10,
                                    onTap: () {
                                      _selectTime(context);
                                    },
                                  ),
                                ),

                                SizedBox(
                                  width: size.width* 0.15,
                                  height: 53,
                                  child: TextFormField(
                                    controller: timesection,

                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300),
                                    decoration: InputDecoration(
                                      hintText: "AM/PM ",
                                      hintStyle: const TextStyle(
                                          fontFamily: "Roboto",
                                          color: Colors.black54,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300),
                                      fillColor: greyColor,
                                      filled: true,
                                      counterText: "",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    onTap: () {
                                      // _selectTime(context);

                                   },

                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(

                            controller: location,

                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              hintText: "Location",
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
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: address,
                          minLines:
                              4, // any number you need (It works as the rows for the textarea)
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
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Number',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                           controller: description,
                          minLines:
                              3, // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "Description",
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
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        UpdateJobdetailsapiCall();
                      },
                      child: Container(
                        height: 45,
                        width: size.width * 0.95,
                        decoration: BoxDecoration(
                          color: buttoncolor,
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
              ),
            )));
  }
}
