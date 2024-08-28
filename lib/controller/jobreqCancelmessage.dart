import 'package:flutter/material.dart';

import '../common/constant.dart';
import 'homescreenAfterlogin.dart';
class JobreqCancelMessage extends StatefulWidget {
  const JobreqCancelMessage({Key? key}) : super(key: key);

  @override
  State<JobreqCancelMessage> createState() => _JobreqCancelMessageState();
}

class _JobreqCancelMessageState extends State<JobreqCancelMessage> {
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
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const HomeScreenAftLogin();
                //     },
                //   ),
                // );
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

                SizedBox( height: 20,),
                Center(
                  child: Text('Your job request cancelled sucessfully!',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          height:1.5
                      ), textAlign: TextAlign.center),
                ),
                          ],
            ),
          ),
        ),

      ),
    );
  }
}
