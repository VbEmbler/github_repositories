import 'package:github_repositories/data/mappers/license_mapper.dart';
import 'package:github_repositories/data/mappers/owner_mapper.dart';
import 'package:github_repositories/data/models/repository_model.dart';
import 'package:github_repositories/domain/entities/repository_entity.dart';

class RepositoryMapper {
  static RepositoryEntity repositoryFromApi(RepositoryModel repository) {
    return RepositoryEntity(
      id: repository.id?.toInt(),
      nodeId: repository.nodeId,
      name: repository.name,
      fullName: repository.fullName,
      owner: OwnerMapper.ownerEntityFromApi(repository.owner),
      htmlUrl: repository.htmlUrl,
      description: repository.description,
      url: repository.url,
      issueEventsUrl: repository.issueEventsUrl,
      issueCommentUrl: repository.issueCommentUrl,
      issuesUrl: repository.issuesUrl,
      stargazersCount: repository.stargazersCount?.toInt(),
      watchersCount: repository.watchersCount?.toInt(),
      language: repository.language,
      hasIssues: repository.hasIssues,
      forksCount: repository.forksCount?.toInt(),
      openIssues: repository.openIssues?.toInt(),
      openIssuesCount: repository.openIssuesCount?.toInt(),
      license: LicenseMapper.licenseEntityFromApi(repository.license),
      forks: repository.forks?.toInt(),
      watchers: repository.watchers?.toInt(),
      defaultBranch: repository.defaultBranch.toString(),
    );
  }

  static List<RepositoryEntity> repositoryListFromApi(List<RepositoryModel> repositoryModelList) {
    final List<RepositoryEntity> repositories = [];
    for(RepositoryModel repositoryEntity in repositoryModelList) {
      repositories.add(RepositoryMapper.repositoryFromApi(repositoryEntity));
    }
    return repositories;
  }

}