import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../ApiServices/completedjobCountApi.dart';
import '../ApiServices/ongoingCountApi.dart';
import '../ApiServices/profileApiServices.dart';
import '../Utils/Connectivity.dart';
import '../common/constant.dart';
import 'completedJobs.dart';
import 'estimateScreen.dart';
import 'jobrequest.dart';
import 'ongoingJobs.dart';
class UserDashboard extends StatefulWidget {
  final String userid;
  const UserDashboard({Key? key, required this.userid}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  String _count = '';
  String _compltcount='';
  String _name='';
  @override
  int _currentIndex = 0;
  final List<String> imagesList = [
    'assets/images/slider11.png',
    'assets/images/slider11.png',
    'assets/images/slider11.png'
  ];

  @override
  void initState() {
    super.initState();
    apiFun();
   OngoingServiceApiCall();
   CompletedServiceApiFunct();
  }
  apiFun() {
    // print('abcd');
    MyProfileApiService.myProfileApiCall(context).then((modelUpdateProfile) async {
      try {
        // print("jkjjkjjkjkjk " + modelUpdateProfile.toString());
        setState(() {
          _name = modelUpdateProfile!.name.toString();
           //  print('dddd'+_name.toString());
        });
      }
      catch (e) {
        print(e);
        throw Exception('Failed');
      }

    });
  }

  OngoingServiceApiCall() {
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
    OngoingServiceCountApi.OngoingCountApiCall(context, widget.userid)
        .then((result) async {
      try {

        //  earnings = result['earnings'].toString();
        setState(() {
          _count = result['count'].toString();
       //   print('dddd'+_count.toString());

        });

        // return _earnings;
      } catch (e) {
        //await progressDialog.hide();
      }
    });
  }

  CompletedServiceApiFunct() {
    CompletedServiceCountApi.CompletedCountApiCall(context, widget.userid)
        .then((result) async {
      try {
        setState(() {
          _compltcount = result['count'].toString();
          //  print('dddd'+_compltcount.toString());

        });

        // return _earnings;
      } catch (e) {
        //await progressDialog.hide();
      }
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: themeColor,


      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: size.width,
                  height: 30,
                  //  color: Colors.green,
                  child: Text('Hi $_name !',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    aspectRatio: 16 / 8,
                    autoPlay: true,
                    height: 180,
                    onPageChanged: (index, reason) {
                      setState(
                            () {
                          _currentIndex = index;
                        },
                      );
                    },
                  ),
                  items: imagesList
                      .map(
                        (item) =>
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Card(
                            elevation: 2.0,
                            shadowColor: themeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              child: Image.asset(
                                item,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                  )
                      .toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: size.width,
                    height: size.height * 0.40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.black12
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.cover, width: 100, height: 100,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 40, right: 40, bottom: 10),
                          child: Center(
                            child: Text(
                              'RV Care brings you the best electrical '
                                  'workers for you. click “new Job request” to get started',
                              style:
                              TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500, height: 1.5
                              ), textAlign: TextAlign.center,),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const JobRequestScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 45,
                            width: size.width * 0.75,
                            decoration: BoxDecoration(
                              color: buttoncolor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "New Job Request",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height: 10,),
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1,
                        color: Colors.black12
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                        width: 200,
                        height: 50,
                        // color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 10),
                          child: Text('Job Request History', style:
                          TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return  OngoingJobScreen(userid:widget.userid);
                                  },
                                ),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: buttoncolor,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: 120,
                                    width: size.width * 0.40,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children:  [
                                          Text(
                                            _count.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Roboto",
                                                fontSize: 25.0,
                                                color: Colors.white),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "On-going",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Roboto",
                                                fontSize: 18.0,
                                                color: Colors.white

                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const CompletedJobScreen();
                                  },
                                ),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: buttoncolor,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: 120,
                                    width: size.width * 0.40,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children:  [
                                          Text(
                                              _compltcount.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Roboto",
                                                fontSize: 25.0,
                                                color: Colors.white),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Completed",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Roboto",
                                                fontSize: 18.0,
                                                color: Colors.white
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const EstimateListScreen();
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 45,
                          width: size.width * 0.95,
                          decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: Colors.black12
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Estimates",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto",
                                    color: buttoncolor,
                                    fontSize: 16,
                                  ),

                                ),
                                SizedBox(width: 5,),
                                Image.asset(
                                  'assets/images/bill.png',
                                  fit: BoxFit.cover, width: 15, height: 15,
                                ),
                              ],
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
      ),

    );
  }

}
