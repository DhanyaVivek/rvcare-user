import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rvcare/model/modelprofiledetails.dart';
import 'package:toast/toast.dart';
import '../Utils/Global.dart';
import 'package:http/http.dart' as http;

import '../common/constant.dart';
import '../model/modelOngoingjobDetails.dart';



class OngoingDetailsApiService{


  static const String url = "${baseURL}api/ongoing-details";

  static Future OngoingDetailsApiCall(BuildContext context,String userId,String jobid) async {
    try {
      var accessToken = Global.shared.accessToken;
      var userId =  Global.shared.userId;
     // var jobid=jobid;
      print("accessss==$accessToken");
      print("user id ==$userId");
      print("jobid ==$jobid");


      Map<String, String> headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      Map<String, String> params = {"id":jobid,"user_id": userId};

      final response =
      await http.post(Uri.parse(url), headers:headers,body: params).timeout(const Duration(seconds: 30));
      print('job details    ${response.body}');
     // print(response.statusCode);
      // var responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        return responseJson;
       // return ModelOngoingjobDetls.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print("uuu+$e.toString()");
      Toast.show("Something went wrong", );
      throw Exception('Failed to load post');
    }

  }

}