import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/utils/constants/constants.dart';

class ApiClient extends GetConnect implements GetxService{
  final String appBaseUrl;
  late SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 90);
    allowAutoSignedCert = true;
    _mainHeaders = {};
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async{
    try{
      Response response = await get(Uri.encodeFull(uri), headers: headers ?? _mainHeaders);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async{
    try{
      Response response = await post(uri, body, headers: headers ?? _mainHeaders);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(String uri, dynamic body) async{
    try{
      Response response = await put(uri, body, headers: _mainHeaders);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(String uri) async{
    try{
      Response response = await delete(uri, headers: _mainHeaders);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }


}