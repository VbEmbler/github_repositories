import 'package:github_repositories/domain/entities/license_entity.dart';
import 'owner_entity.dart';

class RepositoryEntity {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final OwnerEntity? owner;
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
  final LicenseEntity? license;
  final int? forks;
  final int? watchers;
  final String? defaultBranch;

  RepositoryEntity({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.owner,
    this.htmlUrl,
    this.description,
    this.url,
    this.issueEventsUrl,
    this.issueCommentUrl,
    this.issuesUrl,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.forksCount,
    this.openIssues,
    this.openIssuesCount,
    this.license,
    this.forks,
    this.watchers,
    this.defaultBranch,
  });
}


