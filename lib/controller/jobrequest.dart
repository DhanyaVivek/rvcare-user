import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rvcare/controller/homescreenAfterlogin.dart';
import 'package:toast/toast.dart';
import '../ApiServices/RequestServiceApi.dart';
import '../Utils/Connectivity.dart';
import '../Utils/Global.dart';
import '../common/constant.dart';
import '../model/modelRequestservice.dart';
import 'jobrequestSucess.dart';

class JobRequestScreen extends StatefulWidget {
  const JobRequestScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<JobRequestScreen> createState() => _JobRequestScreenState();
}

class _JobRequestScreenState extends State<JobRequestScreen> {
  var worktypeTextController = TextEditingController();
  var dateTextController = TextEditingController();
  var timeTextController = TextEditingController();
  var sectionTextController=TextEditingController();
  var locationTextController = TextEditingController();
  var addressTextController = TextEditingController();
  var mobileTextController = TextEditingController();
  var descriptionTextController = TextEditingController();
  late ModelRequestservice modelRequestservice;

  bool _validate = false;
  String dateFormat = '';
 // String _selectedTime= '';
  TimeOfDay? _selectedTime;
  @override
  void dispose() {
    timeTextController.dispose();
    super.dispose();
  }
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        timeTextController.text = _selectedTime!.format(context); // Update the text field
      });
    }
  }
  RequestServApiCall() {
    ConnectivityCheck.checkConnection().then((connectionResult) async {
      if (connectionResult) {
        ApiFunc();
      } else {
        Toast.show(
          "Please check your internet connection",
        );

        return;
      }
    });
  }

  void ApiFunc() {
    RequstServiceApi.RequestServiceApiCall(
            context,
            Global.shared.id,
            worktypeTextController.text,
            dateTextController.text,
            timeTextController.text,
            sectionTextController.text,
            locationTextController.text,
            addressTextController.text,
            mobileTextController.text,
            descriptionTextController.text)
        .then((modelRequestservice) async {
      try {
       // modelRequestservice = model!;
        print('hihi');
       // print(modelRequestservice!.message);
        if (modelRequestservice?.message !='') {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
                return JobRequestSucess();
              },
            ),
          );
        } else {
          // Navigator.pop(context);
          Toast.show( "Failed to add data,plese check all field are valid");
        }
      } catch (e) {
        Navigator.pop(context);
        // Toast(model.message.toString(),);
        print(e);
      }
    });
  }

  @override
  // void dispose() {
  //   timeTextController.dispose();
  //  ampmTextController.dispose();
  //   super.dispose();
  // }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: themeColor,
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
            "New Job Request",
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
            color: themeColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.1,
                      width: size.width,
                      color: messagebox,
                      child: Row(
                        children: [
                          Container(
                            height: size.height * 0.04,
                            width: size.width * 0.06,
                            padding: EdgeInsets.only(left: 5),
                            //color: Colors.green,
                            child: Icon(
                              Icons.info_outlined,
                              size: 25,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 20),
                              child: const Center(
                                child: Text(
                                  'We are dedicated to providing eletrical services.'
                                  'To ensure top-quality service,kindly request jobs within this category. ',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xfffFF7A00),
                                      height: 1.3,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.justify,
                                  maxLines: 3, // Limit the text to 2 lines
                                  //   overflow: TextOverflow.ellipsis, // Use ellipsis (...) for overflow
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: worktypeTextController,

                            validator: (value) {
                              if (value!.isEmpty) {
                                return "worktype";
                              } else (_isKeyInValid) {
                                return "null";
                              };
                            },
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              hintText: "Eg:Washing machine repair etc",
                              hintStyle: const TextStyle(
                                  fontFamily: "Roboto",
                                  color: Colors.black54,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300),
                              errorText: _validate ? "Value Can't Be Empty" : null,

                              fillColor: greyColor,
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
                    SizedBox(
                      height: 15,
                    ),

                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.42,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: dateTextController,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300),
                                  decoration: InputDecoration(
                                    hintText: "DD/MM/YYYY",
                                    hintStyle: const TextStyle(
                                        fontFamily: "Roboto",
                                        color: Colors.black54,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w300),
                                    errorText: _validate ? "please enter date" : null,
                                    fillColor: greyColor,
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
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context, initialDate: DateTime.now(),
                                        firstDate: DateTime(1950), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime.now().add(Duration(days: 365)),
                                      );

                                      if(pickedDate != null ){
                                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                        //you can implemen t different kind of Date Format here according to your requirement

                                        setState(() {
                                          dateTextController.text = formattedDate; //set output date to TextField value.
                                        });
                                      }else{
                                        print("Date is not selected");
                                      }
                                    }
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                                                    Text(
                                                      'Time',
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                            Row(
                              children: [
                                SizedBox(
                                  width:size.width * 0.45,
                                  height: 45,
                                  child: TextFormField(
                                    controller: timeTextController,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300),
                                    decoration: InputDecoration(
                                      hintText: "00:00 ",
                                      hintStyle: const TextStyle(
                                          fontFamily: "Roboto",
                                          color: Colors.black54,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300),
                                      fillColor: greyColor,
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
                                    maxLength: 3,
                                    onTap: () {
                                      _selectTime(context);



                                    },

                                  ),
                                ),
                                // SizedBox(height: 20),
                                // SizedBox(
                                //   width: size.width* 0.15,
                                //   height: 45,
                                //   child: TextFormField(
                                //     controller: sectionTextController,
                                //
                                //     style: const TextStyle(
                                //         color: Colors.black,
                                //         fontSize: 14.0,
                                //         fontWeight: FontWeight.w300),
                                //     decoration: InputDecoration(
                                //       hintText: "AM/PM ",
                                //       hintStyle: const TextStyle(
                                //           fontFamily: "Roboto",
                                //           color: Colors.black54,
                                //           fontSize: 12.0,
                                //           fontWeight: FontWeight.w300),
                                //       fillColor: greyColor,
                                //       filled: true,
                                //       counterText: "",
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(10.0),
                                //         borderSide: const BorderSide(
                                //           width: 0,
                                //           style: BorderStyle.none,
                                //         ),
                                //       ),
                                //     ),
                                //     keyboardType: TextInputType.number,
                                //     maxLength: 3,
                                //     onTap: () {
                                //      // _selectTime(context);
                                //
                                //
                                //
                                //     },
                                //
                                //   ),
                                // ),
                              ],
                            ),

    //                         SizedBox(
    //                           height: 45,
    //                           width: size.width * 0.39,
    //                           child:
    //                           TextFormField(
    //                               controller: timeTextController,
    //                               style: const TextStyle(
    //                                   color: Colors.black,
    //                                   fontSize: 14.0,
    //                                   fontWeight: FontWeight.w300),
    //                               decoration: InputDecoration(
    //                                 hintText: "00:00 ",
    //                                 hintStyle: const TextStyle(
    //                                     fontFamily: "Roboto",
    //                                     color: Colors.black54,
    //                                     fontSize: 12.0,
    //                                     fontWeight: FontWeight.w300),
    //                                 fillColor: greyColor,
    //                                 filled: true,
    //                                 counterText: "",
    //                                 border: OutlineInputBorder(
    //                                   borderRadius: BorderRadius.circular(10.0),
    //                                   borderSide: const BorderSide(
    //                                     width: 0,
    //                                     style: BorderStyle.none,
    //                                   ),
    //                                 ),
    //                               ),
    //                               keyboardType: TextInputType.number,
    //                               maxLength: 3,
    // onTap: () {
    // _selectTime(context);
    //
    //
    //
    //                             },
    //
    //                           ),
    //
    //                         ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: locationTextController,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              hintText: "Location",
                              hintStyle: const TextStyle(
                                  fontFamily: "Roboto",
                                  color: Colors.black54,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300),
                              errorText: _validate ? "Please enter location" : null,
                              fillColor: greyColor,
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
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: addressTextController,
                          minLines:
                              4, // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "Address",
                            hintStyle: const TextStyle(
                                fontFamily: "Roboto",
                                color: Colors.black54,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300),
                            errorText: _validate ? "Please enter address" : null,
                            fillColor: greyColor,
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
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Number',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: mobileTextController,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              hintText: "+91 |",
                              hintStyle: const TextStyle(
                                  fontFamily: "Roboto",
                                  color: Colors.black54,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300),
                              errorText: _validate ? "Enter valid Mobile number" : null,
                              fillColor: greyColor,
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
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: descriptionTextController,
                          minLines:
                              3, // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            hintText: "Description",
                            hintStyle: const TextStyle(
                                fontFamily: "Roboto",
                                color: Colors.black54,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300),
                            errorText: _validate ? "Value Can't Be Empty" : null,
                            fillColor: greyColor,
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
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        RequestServApiCall();
                      },
                      child: Container(
                        height: 45,
                        width: size.width * 0.95,
                        decoration: BoxDecoration(
                          color: buttoncolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
