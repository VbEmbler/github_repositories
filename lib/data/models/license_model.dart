import 'dart:convert';

LicenseModel licenseModelFromApi(String str) => LicenseModel.fromApi(json.decode(str));

class LicenseModel {
  final String? key;
  final String? name;
  final String? url;
  final String? nodeId;
  LicenseModel.fromApi(Map<String, dynamic> map)
      : key = map["key"],
        name = map["name"],
        url = map["url"],
        nodeId = map["node_id"];
}
