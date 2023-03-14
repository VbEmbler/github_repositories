import 'package:github_repositories/data/models/owner_model.dart';
import 'package:github_repositories/domain/entities/owner_entity.dart';

class OwnerMapper {
  static OwnerEntity ownerEntityFromApi(OwnerModel? owner) {
    return OwnerEntity(
        id: owner?.id?.toInt(),
        login: owner?.login
    );
  }
}