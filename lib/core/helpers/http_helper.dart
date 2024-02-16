import 'package:dio/dio.dart';
import 'package:havillah/core/api_url_enums.dart';
import 'package:havillah/core/constants.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static String friendlyError = "";
  static final Dio _http = Dio();

  static Future<String> makePostHttp(Map<String, dynamic> req) async {
    var url = Constants.authOperations[AuthEnums.auth.value];
    if (url == null) {
      friendlyError = "Url was not found!";
      return "";
    }

    var request = http.MultipartRequest("POST", Uri.parse(url));

    for (var element in req.entries) {
      request.fields[element.key] = element.value.toString();
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      print(response.reasonPhrase);
    }

    friendlyError = "Something went wrong!";
    return response.reasonPhrase.toString();
  }

  static Future<String> makePost(dynamic req) async {
    var url = Constants.authOperations[AuthEnums.auth.value];

    if (url == null) {
      friendlyError = "Url was not found!";
      return "";
    }

    var response = await _http.post(url,
        data: req,
        options: Options(contentType: Headers.formUrlEncodedContentType));

    if (response.statusCode == 200) {
      print(await response.data);
    } else {
      print(response.statusMessage);
    }

    return response.data;
  }
}
