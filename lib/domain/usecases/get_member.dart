// domain/usecases/get_member.dart
import '../entities/member.dart';
import '../repositories/member_repository.dart';
import 'usecase.dart';

class GetMember extends UseCase<Member?, String> {
  final MemberRepository repository;
  GetMember(this.repository);

  @override
  Future<Member?> call(String id) {
    return repository.getById(id);
  }
}
