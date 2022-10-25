import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weekend_provider/data/app_exception.dart';

class NetworkApiService {
  dynamic responseJson;

  Future<dynamic> getAll(String url) async{
    try{
      var response = await http.get(Uri.parse(url));
      responseJson = returnJsonResponse(response);
      // print('response in service $responseJson');
    }on SocketException{
      throw FetchDataException('no internet connection');
    }
    return responseJson;
  }

  dynamic returnJsonResponse(http.Response response) {
    switch(response.statusCode){
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataException('unexpected error occured');
    }
  }


}