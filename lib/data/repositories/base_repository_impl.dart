// data/repositories/base_repository_impl.dart
import '../../domain/repositories/base_repository.dart';
import '../datasources/base_remote_datasource.dart';
import '../datasources/base_local_datasource.dart';

abstract class BaseRepositoryImpl<Entity, DTO>
    implements BaseRepository<Entity> {
  final BaseRemoteDataSource<DTO> remoteDataSource;
  final BaseLocalDataSource<DTO> localDataSource;

  BaseRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Entity mapToEntity(DTO dto);
  DTO mapToDto(Entity entity);

  @override
  Future<Entity?> getById(String id) async {
    try {
      final dto = await remoteDataSource.getById(id);
      if (dto != null) {
        await localDataSource.cache(dto);
        return mapToEntity(dto);
      }
    } catch (_) {}

    final localDto = await localDataSource.getById(id);
    return localDto != null ? mapToEntity(localDto) : null;
  }
}
