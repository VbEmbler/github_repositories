import 'package:github_repositories/data/models/license_model.dart';
import 'package:github_repositories/domain/entities/license_entity.dart';

class LicenseMapper {
  static LicenseEntity licenseEntityFromApi(LicenseModel? license) {
    return LicenseEntity(
        key: license?.key,
        name: license?.name,
        url: license?.url,
        nodeId: license?.nodeId
    );
  }
}