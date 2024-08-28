import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../ApiServices/EstimateDetailsApi.dart';
import '../ApiServices/acceptEstimateApi.dart';
import '../Utils/Connectivity.dart';
import '../Utils/Global.dart';
import '../common/constant.dart';
import '../model/modelEstimateDetails.dart';
import 'estimateDEclineAlert.dart';
import 'estimateScreen.dart';
import 'homescreenAfterlogin.dart';
class EstimatreDetailsScreen extends StatefulWidget {
  final String jobid;
  const EstimatreDetailsScreen({Key? key, required this.jobid}) : super(key: key);

  @override
  State<EstimatreDetailsScreen> createState() => _EstimatreDetailsScreenState();
}

class _EstimatreDetailsScreenState extends State<EstimatreDetailsScreen> {
  String _servicedesc ='';
  String _servicecost ='';
  String _estifinisdate ='';
  String _estimtime ='';
  String _meterial ='';
  String _meterialcost ='';
  late ModelEstimatedetails modelEstimatedetails;
  @override
  void initState() {
    super.initState();
    estimateDetailsApiCall();
  }
  estimateDetailsApiCall() {
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
    EstimateDetailsApiService.EstimateDetailsApiCall(context, Global.shared.userId,widget.jobid)
        .then((modelEstimatedetails) async {
      try {
       print(widget.jobid);
        setState(() {
          _servicedesc=modelEstimatedetails!.serviceOffered.toString();
          _servicecost=modelEstimatedetails.servicePrice.toString();
          _estifinisdate= modelEstimatedetails.estimateDate.toString();
          _estimtime=modelEstimatedetails.estTime.toString();
          _meterial=modelEstimatedetails.material.toString();
          _meterialcost=modelEstimatedetails.materialPrice.toString();
          // _servicedesc = result['serviceOffered'].toString();
          // _servicecost= result['servicePrice'].toString();
          // _estifinisdate= result['estimateDate'].toString();
          // _estimtime= result['estTime'].toString();
          // _meterial= result['address'].toString();
          // _meterialcost= result['materialPrice'].toString();

           // print('dddd'+_servicedesc.toString());

        });

        // return _earnings;
      } catch (e) {
        //await progressDialog.hide();
      }
    });
  }

  AcceptEstimateApiFunct() {
    AcceptEstimateApi.AcceptEstimateApiCall(context,Global.shared.userId, widget.jobid)
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
          "View Estimates",
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
                  height: size.height * 0.75 ,
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

                                  child: Text('Estimate Details',style: TextStyle(fontSize: 16,
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
                                'Service Description',
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
                                    hintText: _servicedesc,
                                    hintStyle: const TextStyle(
                                        fontFamily: "Roboto",
                                        color: Colors.black54,
                                        fontSize: 12.0,
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
                                'Service Cost',
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
                                    hintText: _servicecost,
                                    hintStyle: const TextStyle(
                                        fontFamily: "Roboto",
                                        color: Colors.black54,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400),
                                    //fillColor: greyColor,
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
                                      'Estimated Finishing Date',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        // controller: nomineeDobTextController,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400),
                                        decoration: InputDecoration(
                                          hintText: _estifinisdate,
                                          hintStyle: const TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.black54,
                                              fontSize: 12.0,
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
                                    'Estimated Time',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height:25,),
                                  SizedBox(
                                    height: 45,
                                    width: size.width * 0.39,
                                    child: TextFormField(
                                      //controller: nomineeAgeTextController,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300),
                                        decoration: InputDecoration(
                                          hintText:_estimtime,
                                          hintStyle: const TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.black54,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400),
                                          //fillColor: greyColor,
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
                                'Meterial Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                // controller: name,
                                minLines: 1, // any number you need (It works as the rows for the textarea)
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText: _meterial,
                                  hintStyle: const TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.black54,
                                      fontSize: 12.0,
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
                                'Meterial Cost',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                // controller: name,
                                minLines: 1, // any number you need (It works as the rows for the textarea)
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText: _meterialcost,
                                  hintStyle: const TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.black54,
                                      fontSize: 12.0,
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

              ),
              Container(
                width: size.width,
                height: size.height * 0.09,
             //   color: messagecolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: (){
                       CustomAlert();


                      },
                      child: Container(
                        height: 44,
                        width: size.width* 0.42,
                        decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color:buttoncolor
                          ),
                        ),
                        child:  const Center(
                          child:   Text(
                            "Decline",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto",
                              color: buttoncolor,
                              fontSize: 16,
                            ),

                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        AcceptEstimateApiFunct();

                      },
                      child: Container(
                        height: 44,
                        width: size.width* 0.42,
                        decoration: BoxDecoration(
                          color: buttoncolor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color: buttoncolor
                          ),
                        ),
                        child:  Center(
                          child: Text(
                          "Accept",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto",
                            color: Colors.white,
                            fontSize: 16,
                          ),

                              ),
                        ),
                      ),
                    )
                  ],
                ),

              )
            ],
          ),
        ),

      ),
    );
  }


void CustomAlert() {
  showDialog(context: context,
      builder: (context)
      {
        return  EstimateDeclineAlert(jobid:widget.jobid);
      });
}
}