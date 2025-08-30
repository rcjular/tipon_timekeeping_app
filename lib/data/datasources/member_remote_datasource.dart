// data/datasources/user_remote_datasource.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/member_dto.dart';
import 'base_remote_datasource.dart';

class FirestoreMemberRemoteDataSource implements BaseRemoteDataSource<MemberDto> {
  final FirebaseFirestore firestore;
  FirestoreMemberRemoteDataSource(this.firestore);

  @override
  Future<MemberDto?> getById(String id) async {
    final doc = await firestore.collection('members').doc(id).get();
    if (!doc.exists) return null;
    return MemberDto.fromFirestore(doc.data()!, 'memberid', 'membername', 'department', 'teamleaderid');
  }
}
