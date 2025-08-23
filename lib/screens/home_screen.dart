import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:tipon_timekeeping_app/config/routes.dart';

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
      appBar: AppBar(
        title: Text('Hi ($displayName)'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              selected: _selectedIndex == 0,
              onTap: () {
                Navigator.pop(ctx);
                _onItemTapped(0);
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
                Navigator.pop(ctx);
                _onItemTapped(1);
              },
            ),
          ],
        ),
      ),
      // body: _pages[_selectedIndex],
      body: Center(
        child: Column(
          children: [
            Text('Welcome!', style: Theme.of(context).textTheme.displaySmall),
            const SignOutButton(),
          ],
        ),
      ),      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Daily Time Record'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
