import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rvcare/model/modelprofiledetails.dart';
import 'package:toast/toast.dart';
import '../Utils/Global.dart';
import 'package:http/http.dart' as http;

import '../common/constant.dart';



class MyProfileApiService{


  static const String url = "${baseURL}api/user-profile";

  static Future<ProfileDetails?> myProfileApiCall(BuildContext context) async {
    try {
      var accessToken = Global.shared.accessToken;
      var userId =  Global.shared.userId;
      print("accessss==$accessToken");
      print("user id ==$userId");


      Map<String, String> headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      Map<String, String> params = {"user_id": userId};

      final response =
      await http.post(Uri.parse(url), headers:headers,body: params).timeout(const Duration(seconds: 30));
      print('profile details    ${response.body}');
     // var responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        return ProfileDetails.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print("uuu+$e.toString()");
      Toast.show("Something went wrong", );
      throw Exception('Failed to load post');
    }

  }
}