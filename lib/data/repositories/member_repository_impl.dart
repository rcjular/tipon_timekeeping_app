// data/repositories/member_repository_impl.dart
import '../../domain/entities/member.dart';
import '../../domain/repositories/member_repository.dart';
import '../models/member_dto.dart';
import '../datasources/member_remote_datasource.dart';
import '../datasources/member_local_datasource.dart';
import 'base_repository_impl.dart';

class MemberRepositoryImpl
    extends BaseRepositoryImpl<Member, MemberDto>
    implements MemberRepository {
  MemberRepositoryImpl({
    required FirestoreMemberRemoteDataSource remoteDataSource,
    required HiveMemberLocalDataSource localDataSource,
  }) : super(remoteDataSource: remoteDataSource, localDataSource: localDataSource);

  @override
  Member mapToEntity(MemberDto dto) => Member(memberid: dto.memberid, membername: dto.membername, department: dto.department, teamleaderid: dto.teamleaderid);

  @override
  MemberDto mapToDto(Member entity) => MemberDto(memberid: entity.memberid, membername: entity.membername, department: entity.department, teamleaderid: entity.teamleaderid);

  @override
  Future<List<Member>> getAllMembers() async {
    // Example implementation
    return [];
  }
}
