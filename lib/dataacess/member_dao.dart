import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tipon_timekeeping_app/models/member_model.dart';


class MemberDao {
  CollectionReference<Map<String, dynamic>> _getMemberCollection(String memberid,String timerecordid) {
    return FirebaseFirestore.instance
        .collection('members')
        .doc(memberid)
        .collection('timerecords')
        .doc(timerecordid)
        .collection('timelogs');
  }

  Future<void> addMember(String memberId, String timerecordid, MemberModel member) {
    return _getMemberCollection('', timerecordid)
        .doc(member.memberid)
        .set(member.toMap());
  }

  Future<MemberModel?> getMember(String schoolId, String classId, String studentId) async {
    final doc = await _getMemberCollection(schoolId, classId).doc(studentId).get();
    if (doc.exists) {
      return MemberModel.fromMap(doc.data()!, doc.id);
    }
    return null;
  }

  Stream<List<MemberModel>> getAllStudents(String schoolId, String classId) {
    return _getMemberCollection(schoolId, classId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => MemberModel.fromMap(doc.data(), doc.id)).toList());
  }

  Future<void> updateStudent(String schoolId, String classId, MemberModel student) {
    return _getMemberCollection(schoolId, classId)
        .doc(student.memberid)
        .update(student.toMap());
  }

  Future<void> deleteStudent(String schoolId, String classId, String studentId) {
    return _getMemberCollection(schoolId, classId)
        .doc(studentId)
        .delete();
  }
}