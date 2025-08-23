// models/teamleader_model.dart
class TeamLeaderModel {
  String userid;
  String name;

  TeamLeaderModel({required this.userid, required this.name});

  factory TeamLeaderModel.fromMap(Map<String, dynamic> data, String userid) {
    return TeamLeaderModel
      (userid: userid,
       name: data['name'] ?? ''
       );
  }

  Map<String, dynamic> toMap() => {
        'userid': userid,
        'name': name
    };  
}