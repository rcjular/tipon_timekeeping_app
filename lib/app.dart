// File: lib/app.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tipon_timekeeping_app/auth_gate.dart';
import 'package:tipon_timekeeping_app/presentation/pages/member_page.dart';
import 'package:tipon_timekeeping_app/screens/home_screen.dart';
import 'package:tipon_timekeeping_app/screens/home_screen_signout.dart';
import 'config/routes.dart';
import 'firebase_options.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.clientId});

  final String clientId;  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tipon Timekeeper',
      // home: AuthGate(clientId: clientId), //load Authentication when in PROD
      // home : HomeScreen(),
      home : MemberPage(memberId: ""),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: appRoutes,
    );
  }
}
