import 'dart:convert';
import 'package:github_repositories/data/models/license_model.dart';
import 'owner_model.dart';

List<RepositoryModel> repositoryModelListFromApi(String str) =>
    List<RepositoryModel>.from(json.decode(str).map((x) => RepositoryModel.fromApi(x)));
RepositoryModel repositoryModelFromApi(String str) =>
    RepositoryModel.fromApi(json.decode(str));

class RepositoryModel {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final OwnerModel? owner;
  final String? htmlUrl;
  final String? description;
  final String? url;
  final String? issueEventsUrl;
  final String? issueCommentUrl;
  final String? issuesUrl;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final bool? hasIssues;
  final int? forksCount;
  final int? openIssues;
  final int? openIssuesCount;
  final LicenseModel? license;
  final int? forks;
  final int? watchers;
  final String? defaultBranch;
  RepositoryModel.fromApi(Map<String, dynamic> map)
      : id = map["id"],
        nodeId = map["node_id"],
        name = map["name"],
        fullName = map["full_name"],
        owner = map["owner"] == null ? null : OwnerModel.fromApi(map["owner"]),
        htmlUrl = map["html_url"],
        description = map["description"],
        url = map["url"],
        issueEventsUrl = map["issue_events_url"],
        issueCommentUrl = map["issue_comment_url"],
        issuesUrl = map["issues_url"],
        stargazersCount = map["stargazers_count"],
        watchersCount = map["watchers_count"],
        language = map["language"],
        hasIssues = map["has_issues"],
        forksCount = map["forks_count"],
        openIssues = map["open_issues"],
        openIssuesCount = map["open_issues_count"],
        license = map["license"] == null
            ? null
            : LicenseModel.fromApi(map["license"]),
        forks = map["forks"],
        watchers = map["watchers"],
        defaultBranch = map["default_branch"];
}
