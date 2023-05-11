import 'dart:convert';
import 'dart:io';

import 'package:itti_technical_test/helpers/app_config.dart';
import 'package:itti_technical_test/models/client_model.dart';
import 'package:itti_technical_test/services/http_services.dart';

class ClientService {
  HttpServices httpServices = HttpServices();

  Future<ClientModel> getCart() async {
    var response = await httpServices.get("${AppConfig.url}/users");
    if (response.statusCode == 200) {
      var body = response.body;
      return ClientModel.fromJson(jsonDecode(body));
    } else if (response.statusCode >= 400 && response.statusCode <= 499) {
      if (response.body.isNotEmpty) {
        throw SocketException(response.body);
      } else {
        throw Exception("Ha ocurrido un error");
      }
    } else {
      throw Exception("Ha ocurrido un error");
    }
  }
}
