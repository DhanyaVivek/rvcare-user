import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import '../Utils/Global.dart';
import '../common/constant.dart';
import '../model/modelupdateprofile.dart';


class UpdateJobDetailsApiServices{

  static const String url = baseURL +"api/update-service";
  static Future UpdatejobdetlApiCall({required BuildContext context,
    required String userid,
    required String jobid,
    required String typework,
    required String date,
    required String time,
    required String section,
    required String mobile,
    required String address,
    required String location,
    required String description,


  }) async {
    ToastContext().init(context);
    try {

      var accessToken = Global.shared.accessToken;
      var userId =  Global.shared.userId;
      print("accessss==$accessToken");
      print("user id ==$userId");


      Map<String, String> headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var formData = FormData.fromMap({
        "id":jobid,
        "user_id":userid,
        "type_work": typework,
        "date": date,
        "time": time,
        "time_section":section,
        "mobile": mobile,
        "address": address,
        "location": location,
        "description": description,


      });

      print(formData.fields);
      Dio dio = Dio();
      final response = await dio.post(
        url,
        options:Options( headers: headers,method: 'POST'),
        data: formData,
        onSendProgress: (received, total) {

          // if (total != -1) {
          //   print('${(received / total * 100).toStringAsFixed(0)}%');
          // }
        },
      );
      var responseJson = response.data;
      print(responseJson);
      return  responseJson;
    } catch (e) {
      print("uuu+$e.toString()");
      Toast.show("Something went wrong", duration: Toast.lengthShort, gravity:  Toast.bottom);
      throw Exception('Failed to load post');
    }
  }}

