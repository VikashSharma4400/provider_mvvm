

import 'package:provider_mvvm/data/response/api_status.dart';

class ApiResponse<T>{

  ApiStatus? apiStatus;
  T? data;
  String? message;

  ApiResponse(this.apiStatus, this.data, this.message);

  ApiResponse.loading() : apiStatus = ApiStatus.LOADING;
  ApiResponse.completed() : apiStatus = ApiStatus.COMPLETED;
  ApiResponse.error() : apiStatus = ApiStatus.ERROR;

  @override
  String toString(){
    return "Status: $apiStatus \n Message: $message \n Data: $data";
  }

}