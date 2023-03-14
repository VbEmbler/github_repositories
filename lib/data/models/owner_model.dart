import 'dart:convert';
OwnerModel ownerModelFromApi(String str) => OwnerModel.fromApi(json.decode(str));

class OwnerModel {
  final String? login;
  final int? id;
  OwnerModel.fromApi(Map<String, dynamic> map)
      : login = map["login"],
        id = map["id"];
}