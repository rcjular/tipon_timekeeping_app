import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:tipon_timekeeping_app/config/routes.dart';
import 'package:tipon_timekeeping_app/widgets/attendance_tile.dart';
import 'package:tipon_timekeeping_app/widgets/summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late User? user = FirebaseAuth.instance.currentUser;
  
  late String displayName = user?.displayName ?? user?.email ?? 'Guest';

  static const List<Widget> _pages = [
    Center(child: Text('Daily Time Record', style: TextStyle(fontSize: 32))),
    Center(child: Text('Reports', style: TextStyle(fontSize: 32))),
    Center(child: Text('Timekeeping Policy Setup', style: TextStyle(fontSize: 32))),
  ];

  void _onItemTapped(int idx) {
    setState(() => _selectedIndex = idx);
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Hi Team Leader ($displayName)'),
      //),
      appBar: AppBar(
        centerTitle: true, // ensures title is centered
        title: Text(
          "Hi Team Leader (Evelyn)",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),

        // put the app icon in leading (before title)
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo-header.webp',
            height: 35,
          ),
        ),
      ),      

      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                Navigator.pop(ctx);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Members'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.popAndPushNamed(context, AppRoutes.member);
              },
            ),            
            ListTile(
              leading: const Icon(Icons.punch_clock_outlined),
              title: const Text('Time Record'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.popAndPushNamed(context, AppRoutes.member);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_chart),
              title: const Text('Reports'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.pop(ctx);
                _onItemTapped(1);
              },
            ),
            ExpansionTile(
              leading: const Icon(Icons.folder),
              title: const Text('Settings'),
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Timekeeping Policy Setup'),
                  selected: _selectedIndex == 2,
                  onTap: () {
                    Navigator.popAndPushNamed(context, AppRoutes.timekeepingpolicysetup);
                    // _onItemTapped(2);
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              selected: _selectedIndex == 1,
              onTap: () {
                const SignOutButton();
              },
            ),
          ],
        ),
      ),
      // body: _pages[_selectedIndex],
      // body: Center(
      //   child: Column(
      //     children: [
      //       Text('Welcome!', style: Theme.of(context).textTheme.displaySmall),
      //       const SignOutButton(),

      //     ],
      //   ),
      // ),      
       body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// SUMMARY CARDS
            GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: const [
                SummaryCard(
                  title: "Total Reg Hours",
                  value: "22h",
                  icon: Icons.timer,
                  color: Colors.blue,
                ),
                SummaryCard(
                  title: "Total ND",
                  value: "0h 30m",
                  icon: Icons.nightlight,
                  color: Colors.green,
                ),
                SummaryCard(
                  title: "Total OT",
                  value: "2h",
                  icon: Icons.work_history,
                  color: Colors.orange,
                ),
                SummaryCard(
                  title: "Total ND OT",
                  value: "0h 30m",
                  icon: Icons.nights_stay,
                  color: Colors.green,
                ),              ],
            ),
            const SizedBox(height: 24),

            /// ATTENDANCE HISTORY
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Member Attendance History",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 12),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                AttendanceTile(
                  membername: "Jenon Lee",
                  date: "2025-08-25",
                  checkIn: "08:05 AM",
                  checkOut: "05:15 PM",
                  hours: "8h 30m",
                  status: "On Time",
                ),
                AttendanceTile(
                  membername: "Adelia Ombrosa",
                  date: "2025-08-25",
                  checkIn: "08:25 AM",
                  checkOut: "05:00 PM",
                  hours: "8h 05m",
                  status: "Late",
                ),
                AttendanceTile(
                  membername: "Kia Hernansez",
                  date: "2025-08-25",
                  checkIn: "08:00 AM",
                  checkOut: "05:10 PM",
                  hours: "8h 40m",
                  status: "On Time",
                ),
              ],
            ),
          ],
        ),
      ),      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.punch_clock_outlined), label: 'Daily Time Record'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Sign Out'),
        ],
      ),
    );
  }
}

