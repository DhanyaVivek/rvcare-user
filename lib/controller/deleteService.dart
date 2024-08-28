import 'package:flutter/material.dart';
import 'package:rvcare/Utils/Global.dart';
import 'package:rvcare/common/constant.dart';
import 'package:rvcare/controller/homescreenAfterlogin.dart';
import 'package:toast/toast.dart';

import '../ApiServices/deletejobserviceApi.dart';
import '../ApiServices/rejectEstimateApi.dart';
class DeleteServiceAlert extends StatefulWidget {
  final String jobid;
  const DeleteServiceAlert({Key? key, required this.jobid}) : super(key: key);

  @override
  State<DeleteServiceAlert> createState() => _DeleteServiceAlertState();
}

class _DeleteServiceAlertState extends State<DeleteServiceAlert> {
  @override

  void initState() {
    super.initState();

  }

  DeleteServiceApiFunct() {
    DeleteServiceApi.DeleteServiceApiCall(context,Global.shared.userId, widget.jobid)
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
                  'Are you sure you want to cancel this?',
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
                  'Once you cancel this you cannot undone.',
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
                      DeleteServiceApiFunct();
                    },
                    child: Text('Yes,Cncel',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontFamily: "Roboto",
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
