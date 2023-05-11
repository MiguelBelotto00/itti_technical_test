import 'package:itti_technical_test/models/user_model.dart';

class ClientModel {
  List<UserModel> data = [];

  ClientModel({
    required this.data,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        data: List<UserModel>.from(
            json["data"].map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
