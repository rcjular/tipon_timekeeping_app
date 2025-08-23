import 'package:flutter/material.dart';
import 'package:tipon_timekeeping_app/screens/dashboard/daily_time_record_screen.dart';
import 'package:tipon_timekeeping_app/screens/dashboard/timekeeping_schedule_screen.dart';
import 'package:tipon_timekeeping_app/screens/settings/timekeeping_policy_setup_schedule_screen.dart';
import 'package:tipon_timekeeping_app/screens/settings/timekeeping_policy_setup_screen.dart';
import '../screens/home_screen.dart';

// Define route names as constants
class AppRoutes {
   static const home = '';
   static const timekeepingpolicysetup = '/settings/timekeeping_policyt_setup_screen.dart';
   static const timekeepingschedule = '/dashboard/timekeeping_schedule_screen.dart';
   static const dailytimerecord = '/dashboard/daily_time_record_screen.dart';
}

// Create a routes map
final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.home: (ctx) => const HomeScreen(),
  AppRoutes.timekeepingpolicysetup: (ctx) => const TimekeepingPolicySetupScreen(),
  AppRoutes.timekeepingschedule: (ctx) => const TimekeepingScheduleScreen(),
  AppRoutes.dailytimerecord: (ctx) => const DailyTimeRecordScreen()
};