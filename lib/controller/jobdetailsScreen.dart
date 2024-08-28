import 'package:flutter/material.dart';
import 'package:rvcare/Utils/Global.dart';
import 'package:toast/toast.dart';

import '../ApiServices/ongoingJobDetailsApi.dart';
import '../Utils/Connectivity.dart';
import '../common/constant.dart';
import 'JobrequestEdit.dart';
import 'deleteService.dart';
import 'homescreenAfterlogin.dart';
import 'jobcancelAlertbox.dart';
class JobDetailsScreen extends StatefulWidget {
  final String jobid;
  final String title;
  const JobDetailsScreen({Key? key, required this.jobid, required this.title}) : super(key: key);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  String _typework ='';
  String _date='';
  String _time='';
  String _timesection='';
  String _location='';
  String _address='';
  String _mobile='';
  String _description='';
  @override
  void initState() {
    super.initState();
    OngoingJobDetailsApiCall();
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
      //  print('object');
        setState(() {
          _typework = result['type_work'].toString();
          _date= result['date'].toString();
          _time= result['time'].toString();
          _timesection= result['time_section'].toString();
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
                    return  HomeScreenAftLogin();
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
                               PopupMenuButton(
                                 child: Container(
                                   // margin: const EdgeInsets.only(bottom:50),
                                   child: Icon(
                                     Icons.keyboard_control,
                                     size: 26,
                                     color: Colors.black,
                                   ),
                                 ),
                                 itemBuilder: (context) => [

                                   PopupMenuItem(
                                     child: const Text('Edit',
                                         style: TextStyle(fontSize: 13,
                                         color:textcolor,
                                         fontWeight: FontWeight.w400)),
                                     value: 1,
                                     onTap: () async {
                                       final navigator = Navigator.of(context);
                                       await Future.delayed(Duration.zero);
                                       navigator.push(
                                         MaterialPageRoute(builder: (_) => JobRequestEditScreen(userid:Global.shared.userId,jobid:widget.jobid)),
                                       );
                                     },

                                     //   Navigator.push(
                                     //     context,
                                     //     MaterialPageRoute(
                                     //       builder: (context) {
                                     //         return const JobRequestEditScreenm();
                                     //       },
                                     //     ),
                                     //   );
                                    //  },
                                   ),
                                   PopupMenuItem(
                                     child: const Text('Cancel',style: TextStyle(fontSize: 13,
                                         color:textcolor,
                                         fontWeight: FontWeight.w400)),
                                     value: 2,
                                     onTap: () async {
                                     //  await  CustomAlert();
                                       Future.delayed(
                                           const Duration(seconds: 0),
                                       () =>  CustomAlert(),);
                                     },
                                   ),
                                 ],

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
                         Row(
                           children: [
                             Container(
                               height: size.height * 0.03,
                               width: size.width *0.05,
                               padding: EdgeInsets.only(left: 5),
                               //color: Colors.green,
                               child:Icon(
                                 Icons.info_outlined,
                                 size: 20,
                                 color: Colors.orange,
                               ),
                             ),
                             SizedBox(width: 5,),
                             Expanded(
                               flex: 3,
                               child: Container(
                                 padding: EdgeInsets.only(left: 10,right: 20),
                                 child: const Center(
                                   child: Text('You can edit or delete job requests until the end of the day before the scheduled service ',
                                     style: TextStyle(fontSize: 11,
                                         color:messagecolor,
                                         height: 1.3,
                                         fontWeight: FontWeight.w400),textAlign: TextAlign.justify,
                                     maxLines: 3, // Limit the text to 2 lines
                                     //   overflow: TextOverflow.ellipsis, // Use ellipsis (...) for overflow
                                     softWrap: true,),
                                 ),
                               ),
                             ),
                           ],
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
                                         hintText:_time +' '+  _timesection,
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
  CustomAlert() {
    showDialog(context: context,
        builder: (context)
        {
          return  DeleteServiceAlert(jobid:widget.jobid);
        });
  }
}



