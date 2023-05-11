import 'dart:io';

import 'package:http/http.dart' as http;

class HttpServices {
  final headersParams = {
    'Content-Type': 'application/json; charset=utf-8',
    'Accept': 'application/json; charset=utf-8',
  };

  Future<http.Response> get(String url, {dynamic headers}) async {
    try {
      var response = await http.get(Uri.parse(url), headers: headersParams);
      return response;
    } on FormatException {
      return http.Response("Ha ocurrido un error", 421);
    } on SocketException {
      return http.Response(
          "Ha ocurrido un error, revise su conexión a Internet", 421);
    } catch (error) {
      return http.Response("", 421);
    }
  }
}
