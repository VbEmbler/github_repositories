import 'package:github_repositories/data/models/repository_readme_model.dart';
import 'package:github_repositories/domain/entities/repository_readme_entity.dart';

class RepositoryReadmeMapper {
  static RepositoryReadmeEntity repositoryReadmeFromApi(RepositoryReadmeModel? repositoryReadme) {
    return RepositoryReadmeEntity(
    name: repositoryReadme?.name,
    path: repositoryReadme?.path,
    sha: repositoryReadme?.sha,
    size: repositoryReadme?.size?.toInt(),
    url: repositoryReadme?.url,
    htmlUrl: repositoryReadme?.htmlUrl,
    gitUrl: repositoryReadme?.gitUrl,
    downloadUrl: repositoryReadme?.downloadUrl,
    type: repositoryReadme?.type,
    content: repositoryReadme?.content,
    encoding: repositoryReadme?.encoding,
    );
  }
}