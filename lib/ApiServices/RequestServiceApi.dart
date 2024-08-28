import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';
import '../Utils/Global.dart';
import '../common/constant.dart';
import '../model/modelRequestservice.dart';

class RequstServiceApi{
  static const String url = "${baseURL}api/request-service";

  static Future<ModelRequestservice?> RequestServiceApiCall(BuildContext context,
    String uid, String type_work, String date, String time, String section,
    String location, String address, String mobile,
      String description, ) async {
    try {

      print('type of work $type_work');
      print('date $date');
      print('time $time');
      print('timesection $section');
      print('location $location');
      print('address $address');
      print('mobile $mobile');
      print('description $description');



      // print(reg_type + gender + experience + job_type + job_cat  );
      var accessToken = Global.shared.accessToken;
      String uid = Global.shared.userId;
      print("$uid");
      print("accessss==$accessToken");
      Map<String, String> headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      print('token');
      var formData = FormData.fromMap({
        "user_id": uid,
        "type_work":type_work,
        "date":date,
        "time":time,
        "time_section":section,
        "location":location,
        "address":address,
        "mobile":mobile,
        "description":description,


      });
      print(formData);
      Dio dio = Dio();
      final response = await dio.post(
        url,
        options: Options(
          headers: headers,),
        // options: RequestOptions(headers: headers, baseUrl: url),
        data: formData,
        onSendProgress: (received, total) {

        },
      );
      print(response.statusCode);
      var responseJson = response.data;
      print(responseJson);

      return responseJson;
    } catch (e) {
      if (e is DioError) {
        print('jiihihihihigugtdrtd${e.response}');
        print(' ${e.response?.statusCode}');
      }
    }


  }
}
