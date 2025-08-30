// domain/repositories/base_repository.dart
abstract class BaseRepository<Entity> {
  Future<Entity?> getById(String id);
}
