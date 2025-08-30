// data/datasources/base_remote_datasource.dart
abstract class BaseRemoteDataSource<DTO> {
  Future<DTO?> getById(String id);
}
