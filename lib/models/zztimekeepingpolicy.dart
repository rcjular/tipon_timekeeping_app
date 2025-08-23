// models/timekeeping_policy.dart
import 'package:tipon_timekeeping_app/models/zztimekeeping_policy_schedule.dart';

class TimekeepingPolicy {
  int policyId;
  String policyName;
  late int minimumRequiredOvertime;
  late int durationOvertimePerCount;
  late int basisOfOvertime;
  late DateTime startDateOvertime;
  late DateTime endDateOvertime;
  late int maximumRegularHours;
  late int lateGracePeriod;
  late int lateCount;
  late int paidupHolidayBasis;
  late int nightDiffHoursbasis;

  late bool mondayRestday;
  late bool tuesdayRestday;
  late bool wednesdayRestday;
  late bool thursdayRestday;
  late bool fridayRestday;
  late bool saturdayRestday;
  late bool sundayRestday;
  late bool flexible;

  List<TimekeepingPolicySchedule> schedules;

  TimekeepingPolicy(
    {required this.policyId, 
     required this.policyName, 
     required this.schedules}
    );

}