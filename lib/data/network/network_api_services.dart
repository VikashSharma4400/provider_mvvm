

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider_mvvm/data/network/base_api_services.dart';

import '../exceptions/app_exceptions.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getApi(String url) async {
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException("No Internet Connection");
    }

    return responseJson;

  }

  @override
  Future postApi(String url, dynamic data) async {

    dynamic responseJson;
    try{
      http.Response response = await http.post(Uri.parse(url),
      body: data
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException();
    }
  }

}