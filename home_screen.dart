import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HasibGo ড্যাশবোর্ড"),
        backgroundColor: Colors.green, // আপনার পছন্দের সবুজ থিম
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // নোটিফিকেশন আইকনে ট্যাপ করলে কী হবে
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // স্বাগতম ব্যানার বা টেক্সট
            const Text(
              "স্বাগতম, HasibGo-তে!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "আজকে আপনি কোন সেবাটি নিতে চান?",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // সার্ভিসগুলোর গ্রিড বা তালিকা ডিজাইন
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // পাশাপাশি দুটি করে বক্স দেখাবে
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  // সার্ভিস ১: রাইড শেয়ারিং
                  ServiceCard(
                    title: "রাইড শেয়ার",
                    icon: Icons.directions_car,
                    onTap: () {
                      // রাইড পেজে যাওয়ার কোড
                    },
                  ),
                  // সার্ভিস ২: ফুড ডেলিভারি
                  ServiceCard(
                    title: "ফুড ডেলিভারি",
                    icon: Icons.fastfood,
                    onTap: () {
                      // ফুড পেজে যাওয়ার কোড
                    },
                  ),
                  // সার্ভিস ৩: পার্সেল ডেলিভারি
                  ServiceCard(
                    title: "পার্সেল",
                    icon: Icons.local_shipping,
                    onTap: () {
                      // পার্সেল পেজে যাওয়ার কোড
                    },
                  ),
                  // সার্ভিস ৪: শপ বা গ্রোসারি
                  ServiceCard(
                    title: "শপ ও বাজার",
                    icon: Icons.shopping_bag,
                    onTap: () {
                      // শপ পেজে যাওয়ার কোড
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// আলাদা সার্ভিস কার্ড ডিজাইন করার ছোট উইজেট
class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.green),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
