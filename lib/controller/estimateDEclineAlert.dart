import 'package:flutter/material.dart';
import 'package:rvcare/Utils/Global.dart';
import 'package:rvcare/common/constant.dart';
import 'package:rvcare/controller/homescreenAfterlogin.dart';
import 'package:toast/toast.dart';

import '../ApiServices/rejectEstimateApi.dart';
class EstimateDeclineAlert extends StatefulWidget {
  final String jobid;
  const EstimateDeclineAlert({Key? key, required this.jobid}) : super(key: key);

  @override
  State<EstimateDeclineAlert> createState() => _EstimateDeclineAlertState();
}

class _EstimateDeclineAlertState extends State<EstimateDeclineAlert> {
  @override

  void initState() {
    super.initState();
   
  }

 RejectEstimateApiFunct() {
    RejectEstimateApi.RejectEstimateApiCall(context,Global.shared.userId, widget.jobid)
        .then((result) async {
      try {
if(result!='')
  {
    print('object');
    Toast.show("Sucess");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return  HomeScreenAftLogin();

        },
      ),
    );
  }
        // return _earnings;
      } catch (e) {
        //await progressDialog.hide();
      }
    });
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
   child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
     Padding(
       padding: const EdgeInsets.only(top: 15.0),
       child: Image.asset(
       'assets/images/alertimg.png',
       fit: BoxFit.cover,width: 65,height: 65,
   ),
     ),
                  SizedBox(height: 20),
                  Material(
                    color: Colors.white,
                    child: Text(
                      'Are you sure you want to decline this?',
                      style: TextStyle(fontSize: 13,
                          fontWeight: FontWeight.w500,
                      color: textcolor,
                      fontFamily: "Roboto"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15),
                  Material(
                    color: Colors.white,
                    child: const Text(
                      'Once you decline this estimate, this job will\n be marked as cancelled.',
                        style: TextStyle(fontSize: 11,
                            fontWeight: FontWeight.w400,
                          color: fontcolor,
                          fontFamily: "Roboto"
                        ),

                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontFamily: "Roboto",
                        color: textcolor),),
                      ),
                      SizedBox(width: 50,),
                      TextButton(
                        onPressed: () {
                          // Handle decline action
                          RejectEstimateApiFunct();
                        },
                        child: Text('Yes',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontFamily: "Roboto",
                            color: messagecolor),
                      ),),
                    ],

                  )
                ],
              ),



        ),
      ),
    );
  }
}
