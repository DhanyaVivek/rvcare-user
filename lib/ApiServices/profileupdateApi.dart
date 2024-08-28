import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import '../Utils/Global.dart';
import '../common/constant.dart';
import '../model/modelupdateprofile.dart';


class ProfileUpdateApiServices{

  static const String url = baseURL +"api/user";
  static Future UpdateProfileApiCall({required BuildContext context,
    required String userid,
    required String name,
    required String mobile,
    required String address,
    required String landmark,


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
        "id":userid,
        "name": name,
        "mobile": mobile,
        "address": address,
        "landmark": landmark,


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

