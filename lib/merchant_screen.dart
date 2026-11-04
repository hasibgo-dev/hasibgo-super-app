import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // ড্যাশবোর্ড স্ট্যাটিস্টিক্স বা পরিসংখ্যান
  final int totalUsers = ১২৫০;
  final int activeRiders = ৩৪০;
  final int activeMerchants = ৮৫;
  final String totalRevenue = "৪৫,৮৫০ টাকা";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HasibGo - অ্যাডমিন প্যানেল"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "সুপার অ্যাপ ওভারভিউ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 15),

            // স্ট্যাটিস্টিক্স গ্রিড বা কার্ডসমূহ
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStatCard("মোট ব্যবহারকারী", "$totalUsers", Icons.people, Colors.blue),
                _buildStatCard("সক্রিয় রাইডার", "$activeRiders", Icons.delivery_dining, Colors.orange),
                _buildStatCard("সক্রিয় মার্চেন্ট", "$activeMerchants", Icons.store, Colors.purple),
                _buildStatCard("আজকের আয়", totalRevenue, Icons.account_balance_wallet, Colors.green),
              ],
            ),
            const SizedBox(height: 30),

            const Text(
              "সিস্টেম ম্যানেজমেন্ট",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),

            // ম্যানেজমেন্ট অপশন লিস্ট
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.verified_user, color: Colors.green),
                    title: const Text("নতুন রাইডার ও মার্চেন্ট অনুমোদন"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("অনুমোদন প্যানেল খোলা হচ্ছে...")),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.local_offer, color: Colors.green),
                    title: const Text("অফার ও ডিসকাউন্ট ম্যানেজমেন্ট"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.green),
                    title: const Text("সিস্টেম সেটিংস ও কন্ট্রোল"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // স্ট্যাট কার্ড তৈরি করার হেল্পার মেথড
  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
