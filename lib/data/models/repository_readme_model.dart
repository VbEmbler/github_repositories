import 'dart:convert';

RepositoryReadmeModel repositoryReadmeModelFromApi(String str) =>
    RepositoryReadmeModel.fromApi(json.decode(str));

class RepositoryReadmeModel {
  final String? name;
  final String? path;
  final String? sha;
  final int? size;
  final String? url;
  final String? htmlUrl;
  final String? gitUrl;
  final String? downloadUrl;
  final String? type;
  final String? content;
  final String? encoding;
  RepositoryReadmeModel.fromApi(Map<String, dynamic> map)
      : name = map["name"],
        path = map["path"],
        sha = map["sha"],
        size = map["size"],
        url = map["url"],
        htmlUrl = map["html_url"],
        gitUrl = map["git_grl"],
        downloadUrl = map["download_url"],
        type = map["type"],
        content = map["content"],
        encoding = map["encoding"];
}
