// data/datasources/base_local_datasource.dart
abstract class BaseLocalDataSource<DTO> {
  Future<DTO?> getById(String id);
  Future<void> cache(DTO dto);
  Future<void> clearCache();
}
