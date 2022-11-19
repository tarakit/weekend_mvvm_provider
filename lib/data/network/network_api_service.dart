import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weekend_provider/data/app_exception.dart';
import 'package:weekend_provider/models/image_reponse.dart';

class NetworkApiService {
  dynamic responseJson;

  Future postArticle(String url, dynamic data, int imageId) async {
    var headers = {
      'Content-Type': 'application/json'
    };

    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode({
      "data": {
        "title": "Hello 14",
        "slug": "2ssdggddssf",
        "content": "hello this is the content",
        "thumbnail": "44",
        "category": "2",
        "tags": [
          1
        ],
        "users_permissions_user": "1"
      }
    });

    request.headers.addAll(headers);
    var response = await request.send();
    var res = await response.stream.bytesToString();
    print('response in service $res');
    return json.decode(res);
  }

  Future uploadImage(String url, File file) async{
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('files', file.path));

    var response = await request.send();
    var resource = await response.stream.bytesToString();
    var decode = json.decode(resource);

    List<ImageResponse> imageResponse =
    List<ImageResponse>.from(decode.map((imageModel) => ImageResponse.fromJson(imageModel)));

    return imageResponse[0].toJson();
  }


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