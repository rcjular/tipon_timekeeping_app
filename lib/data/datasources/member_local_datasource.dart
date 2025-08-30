// data/datasources/member_local_datasource.dart
import 'package:hive/hive.dart';
import '../models/member_dto.dart';
import 'base_local_datasource.dart';

class HiveMemberLocalDataSource implements BaseLocalDataSource<MemberDto> {
  final Box<Map> box;
  HiveMemberLocalDataSource(this.box);

  @override
  Future<MemberDto?> getById(String id) async {
    final data = box.get(id);
    if (data == null) return null;
    return MemberDto.fromFirestore(Map<String, dynamic>.from(data),  'memberid', 'membername', 'department', 'teamleaderid');
  }

  @override
  Future<void> cache(MemberDto dto) async {
    await box.put(dto.memberid, dto.toFirestore());
  }
  
  @override
  Future<void> clearCache() async {
    await box.clear();
  }
}
