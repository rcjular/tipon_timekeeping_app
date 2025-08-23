// models/member_model.dart
class MemberModel {
  String memberid;
  String membername;
  String department;

  MemberModel({required this.memberid, required this.membername, required this.department});
 
  factory MemberModel.fromMap(Map<String, dynamic> data, String memberid) {
    return MemberModel
      (memberid: memberid,
       membername: data['membername'] ?? '',
       department: data['department'] ?? ''
       );
  }

  Map<String, dynamic> toMap() => {
        'memberid': memberid,
        'membername': membername,
        'department': department
    };
}