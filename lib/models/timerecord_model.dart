// models/timerecord_model.dart
class TimerecordModel {
  DateTime entrydatetime;
  String remarks;

  TimerecordModel({required this.entrydatetime, required this.remarks});
 
  factory TimerecordModel.fromMap(Map<String, dynamic> data, DateTime entrydatetime) {
    return TimerecordModel
      (entrydatetime: entrydatetime,
       remarks: data['remarks'] ?? ''       
       );
  }

  Map<String, dynamic> toMap() => {
        'entrydatetime': entrydatetime,
        'remarks': remarks
    };
}