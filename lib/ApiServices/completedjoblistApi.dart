import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';
import '../Utils/Global.dart';
import 'package:http/http.dart' as http;
import '../common/constant.dart';

class CompletedJobsApiServices{

  static const String url = baseURL+"api/completedservice";
  static Future CompletedJobsApiCall(
      BuildContext context, String user_id) async {
  //  print(url);

    try {

      var accessToken = Global.shared.accessToken;
      print(accessToken);
      Map<String, String> headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };


      Map<String, String> params = {"user_id":Global.shared.userId};
      final response =
      await http.post(Uri.parse(url), body: params,headers: headers).timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        return responseJson;
      }
    } catch (e) {
      print("uuu+$e.toString()");
      Toast.show("Something went wrong",  );
    }

  }
}


