import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ইউজারের প্রাথমিক তথ্য
  bool isNotificationsEnabled = true;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HasibGo - প্রোফাইল ও সেটিংস"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // ইউজার প্রোফাইল হেডার কার্ড
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 12),
                const Text(
                  "হাসিব রহমান",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "+৮৮০ ১৭০০০০০০০০ পক্ষ",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Chip(
                  label: const Text("ভেরিফাইড ব্যবহারকারী", style: TextStyle(color: Colors.white, fontSize: 12)),
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          const Text(
            "অ্যাকাউন্ট সেটিংস",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(height: 10),

          // সেটিংস অপশন লিস্ট
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit, color: Colors.green),
                  title: const Text("প্রোফাইল এডিট করুন"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("প্রোফাইল এডিট প্যানেল খোলা হচ্ছে...")),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.green),
                  title: const Text("সংরক্ষিত ঠিকানা"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.payment, color: Colors.green),
                  title: const Text("পেমেন্ট মেথড ও ওয়ালেট"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "অ্যাপ preferences",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(height: 10),

          // প্রিফারেন্স অপশন কার্ড
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.notifications, color: Colors.green),
                  title: const Text("পুশ নোটিফিকেশন"),
                  value: isNotificationsEnabled,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      isNotificationsEnabled = value;
                    });
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.dark_mode, color: Colors.green),
                  title: const Text("ডার্ক মোড"),
                  value: isDarkMode,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // লগআউট বাটন
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text("লগআউট করুন", style: TextStyle(color: Colors.white, fontSize: 16)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("সফলভাবে লগআউট করা হয়েছে!")),
              );
            },
          ),
        ],
      ),
    );
  }
}
