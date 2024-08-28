import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../ApiServices/estimatelistApi.dart';
import '../Utils/Connectivity.dart';
import '../Utils/Global.dart';
import '../common/constant.dart';
import '../model/modelEstimatelist.dart';
import 'estimateDetails.dart';
import 'homescreenAfterlogin.dart';
class EstimateListScreen extends StatefulWidget {

  const EstimateListScreen({Key? key,}) : super(key: key);

  @override
  State<EstimateListScreen> createState() => _EstimateListScreenState();
}

class _EstimateListScreenState extends State<EstimateListScreen> {
  @override
  void initState() {
    super.initState();
    EstimateApiCall();
  }
  List<Estimatedservices> estimatedservices =[];
  EstimateApiCall() {
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
    EstimateApiServices.EstimateApiCall(context, Global.shared.id)
        .then((result) async {
      try {

        if (result['id'] != '') {
          setState(() {
            print('hiihh');
            estimatedservices = ((result[ 'estimatedservices'] ?? []) as List)
                .map((li) => Estimatedservices.fromJson(li))
                .toList();
            print(estimatedservices.length);

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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        centerTitle: false,
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
          "Estimates",
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
              (estimatedservices.length!=0) ?
              SizedBox(
                height: size.height*0.85,
                child:  FutureBuilder(builder: (BuildContext context, snapshot) {
                  return ListView.separated(

                    itemCount: estimatedservices.length,
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
                            height: 200,
                            child: Stack(
                              children: [



                                Positioned(
                                    top: 15,
                                    left: 20,
                                    child: Row(
                                      children:  [
                                        Text(estimatedservices[index].typeWork.toString(), style: const TextStyle(
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
                                        Text('Requested for: ${estimatedservices[index].estimateDate.toString()}', style: const TextStyle(
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
                                        Text('Time :${estimatedservices[index].estTime.toString()}', style: const TextStyle(
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
                                  top: 100,
                                  left: 15,
                                  child: Container(
                                    height: 10,width: 300,
                                    //   color: Colors.greenAccent,
                                    child: Divider(
                                      height: 2,
                                      color: textboxfillcolor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 120,
                                    left: 10,
                                    child: Row(
                                      children:  [
                                        TextButton(
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return  EstimatreDetailsScreen(jobid:estimatedservices[index].id.toString());
                                                },
                                              ),
                                            );


                                          },
                                          child: Container(
                                            height: 43,
                                            width: size.width* 0.82,
                                            decoration: BoxDecoration(
                                              color: themeColor,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black12
                                              ),
                                            ),
                                            child:  Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const  Text(
                                                    "View Estimate",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Roboto",
                                                      color: buttoncolor,
                                                      fontSize: 16,
                                                    ),

                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                        )

                                      ],
                                    )
                                ),

                              ],),));},
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10,);
                    },);
  } ),
              )
                  :
              Padding(
                padding: const EdgeInsets.only(top:300.0),
                child: Container(
                  height:size.height * 1.5 ,

                  child: Text('Currently there is no Estimate to show',
                    style: TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.w400,color: textcolor),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
