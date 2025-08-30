// domain/repositories/member_repository.dart
import '../entities/member.dart';
import 'base_repository.dart';

abstract class MemberRepository extends BaseRepository<Member> {
  Future<List<Member>> getAllMembers(); // extend as needed
  
  @override
  Future<Member?> getById(String id) {
    throw UnimplementedError();
    //  TODO: implement getById
  }

}
