import 'package:flutter/material.dart';
class JobCancelAlertScreen extends StatefulWidget {
  const JobCancelAlertScreen({Key? key}) : super(key: key);

  @override
  State<JobCancelAlertScreen> createState() => _JobCancelAlertScreenState();
}

class _JobCancelAlertScreenState extends State<JobCancelAlertScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Container(
            width: size.width * 0.8,
            height: size.height * 0.20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning, size: 50, color: Colors.orange),
                SizedBox(height: 20),
                Text(
                  'Are you sure you want to decline this?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Once you decline this estimate, this job will be marked as cancelled.',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

                  textAlign: TextAlign.center,
                ),
              ],
            ),
                     ),
        ));


  }
}
