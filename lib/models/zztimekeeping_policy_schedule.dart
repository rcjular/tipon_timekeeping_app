// models/timekeeping_policy_schedule.dart

class TimekeepingPolicySchedule {
  int policyId;
  int scheduleCode;
  String timeIn;
  String timeOut;
  double totalHours;

  TimekeepingPolicySchedule(
    {required this.policyId, 
     required this.scheduleCode,
     required this.timeIn,
     required this.timeOut,
     required this.totalHours}
    );
}