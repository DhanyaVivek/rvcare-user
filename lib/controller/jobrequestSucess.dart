import 'package:flutter/material.dart';
import 'package:rvcare/common/constant.dart';
import 'package:rvcare/controller/homescreenAfterlogin.dart';
class JobRequestSucess extends StatefulWidget {
  const JobRequestSucess({Key? key}) : super(key: key);

  @override
  State<JobRequestSucess> createState() => _JobRequestSucessState();
}

class _JobRequestSucessState extends State<JobRequestSucess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,

      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: buttoncolor,
          actions: [
            IconButton(
              icon: const Icon(Icons.close_rounded,color: Colors.white,),
              tooltip: 'Open shopping cart',
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
          ],
        ),
        body: Container(
          color: buttoncolor,
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    "assets/images/success.png",

                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox( height: 15,),
                Text('Yoay!',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,

                  ),),
                SizedBox( height: 20,),
                Center(
                  child: Text('We appreciate your interest.Your ticket \nnumber is #123456',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                        height:1.5
                    ), textAlign: TextAlign.center),
                ),
                SizedBox( height: 20,),
                Text('Our representative will get in touch with you\nsoon to confirm the time and date for support.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,height:1.5
                  ), textAlign: TextAlign.center),


              ],
            ),
          ),
        ),

      ),
    );
  }
}
