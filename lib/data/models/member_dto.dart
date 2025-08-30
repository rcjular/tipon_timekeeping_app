// data/models/member_dto.dart
class MemberDto {
  final String memberid;
  final String membername;
  final String department;
  final String teamleaderid;

  MemberDto({
            required this.memberid,
            required this.membername,
            required this.department,
            required this.teamleaderid});

  factory MemberDto.fromFirestore(Map<String, dynamic> data, 
            String memberid,
            String membername,
            String department,
            String teamleaderid) {
    return MemberDto(memberid: memberid, 
                     membername: data['membername'] ?? '',
                     department: data['department'] ?? '',
                     teamleaderid: data['teamleaderid'] ?? '',
                     );
  }

  Map<String, dynamic> toFirestore() {
    return {'membername': membername,
             'department': department,
             'teamleaderid':teamleaderid
            };
  }
}
