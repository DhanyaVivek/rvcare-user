import 'package:flutter/material.dart';
import 'package:rvcare/controller/homescreenAfterlogin.dart';
import 'package:toast/toast.dart';

import '../ApiServices/ongoingJobApi.dart';
import '../Utils/Connectivity.dart';
import '../common/constant.dart';
import '../model/modelOngoingjoblist.dart';
import 'jobdetailsScreen.dart';
class OngoingJobScreen extends StatefulWidget {
  final String userid;
  const OngoingJobScreen({Key? key, required this.userid}) : super(key: key);

  @override
  State<OngoingJobScreen> createState() => _OngoingJobScreenState();
}

class _OngoingJobScreenState extends State<OngoingJobScreen> {

  @override
  void initState() {
    super.initState();
    OngoingJobsApiCall();
  }
  List<Ongoinglist> ongoinglist =[];
  OngoingJobsApiCall() {
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

  apiFunc() {
    OngoingJobsApiServices.OngoingJobsApiCall(context, widget.userid)
        .then((result) async {
      try {

        if (result['id'] != '') {
          setState(() {
            print('hiihh');
            ongoinglist = ((result[ 'ongoinglist'] ?? []) as List)
                .map((li) => Ongoinglist.fromJson(li))
                .toList();
           print(ongoinglist.length);

          });
        } else {
          // Toast.show((value['message'].toString()),
          //     duration: Toast.lengthShort, gravity: Toast.bottom);
        }
        // return _earnings;
      } catch (e) {
        //await progressDialog.hide();
      }
    });
  }
  @override
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
                    return const HomeScreenAftLogin();
                  },
                ),
              );
            },
          ),
        ),
        title: const Text(
          "On-going Jobs",
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
             SizedBox(
               height: size.height*0.8,
               child:  FutureBuilder(builder: (BuildContext context, snapshot) {
                 return ListView.separated(

                    itemCount: ongoinglist.length,
                    padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return   Card(
                          color: Colors.white,
                               elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                  color: Color(0xffe0e0e0),
                                ),
                              ),
                          child: SizedBox(
                            height: 130,
                            child: Stack(
                              children: [



                                Positioned(
                                    top: 15,
                                    left: 20,
                                    child: Row(
                                      children:  [
                                        Text(ongoinglist[index].typeWork.toString(), style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "segoe_ui_semibold",
                                        ),
                                        ),

                                      ],
                                    )
                                ),
                                Positioned(
                                    top: 45,
                                    left: 20,
                                    child: Row(
                                      children:  [
                                        Text('Requested for : ${ongoinglist[index].date.toString()}', style: const TextStyle(
                                          color: fontcolor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "SegoeUI",
                                        ),
                                        ),

                                      ],
                                    )
                                ),

                                Positioned(
                                    top: 70,
                                    left: 20,
                                    child: Row(
                                      children:  [
                                        Text('Time :${ongoinglist[index].time.toString()}', style: const TextStyle(
                                          color: fontcolor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "SegoeUI",
                                        ),
                                        ),

                                      ],
                                    )
                                ),
                                Positioned(
                                    top: 95,
                                    left: 20,
                                    child: Row(
                                      children:  [
                      Text('Status :', style:  TextStyle(
                        color: fontcolor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: "SegoeUI",
                      ),
                      ),
                                    ongoinglist[index].status.toString() =="1" ?
                                    Text('Worker Yet To Be Asssigned',style:  TextStyle(
                                      color:messagecolor ,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "SegoeUI",
                                    ))
                                            :
                                    Text('Worker Assigned',
                                    style:  TextStyle(
                                        color: Colors.green,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "SegoeUI",
                                      )),



                                      ],
                                    )
                                ),
                                Positioned(
                                 // top: 20,
                                  left: 270,
                                  child: TextButton(
                                    onPressed: (){
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return  JobDetailsScreen(jobid:ongoinglist[index].id.toString(),
                                            title:ongoinglist[index].typeWork.toString());
                                          },
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 26,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),],),));},
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10,);
                    });
  },
             )
             )],
          ),
        ),
      ),
    );
  }
}
