import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'merchant_screen.dart';
import 'rider_screen.dart';
import 'admin_screen.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';
import 'wallet_screen.dart';
import 'tracking_screen.dart';

void main() {
  runApp(const HasibGoSuperApp());
}

class HasibGoSuperApp extends StatelessWidget {
  const HasibGoSuperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HasibGo Super App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  // বিভিন্ন প্যানেল বা স্ক্রিনের তালিকা
  final List<Widget> _screens = [
    const HomeScreen(),
    const MerchantScreen(),
    const RiderScreen(),
    const AdminScreen(),
    const ProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'হোম',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'মার্চেন্ট',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'রাইডার',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'অ্যাডমিন',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'প্রোফাইল',
          ),
        ],
      ),
    );
  }
}
