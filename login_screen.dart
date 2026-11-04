import 'package:flutter/material.dart';
import 'rider_screen.dart';
import 'merchant_screen.dart';
import 'admin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HasibGo - হোম ড্যাশবোর্ড"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // নোটিফিকেশন কাজ
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // স্বাগতম ব্যানার
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "আসসালামু আলাইকুম, হাসিব!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "আজকে আপনি HasibGo থেকে কোন সেবাটি নিতে চান?",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              const Text(
                "আমাদের সেবাসমূহ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              // সার্ভিস গ্রিড
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(
),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  ServiceIconCard(icon: Icons.directions_bike, label: "রাইড শেয়ার"),
                  ServiceIconCard(icon: Icons.delivery_dining, label: "পার্সেল"),
                  ServiceIconCard(icon: Icons.restaurant, label: "ফুড ডেলিভারি"),
                  ServiceIconCard(icon: Icons.local_grocery_store, label: "গ্রোসারি"),
                  ServiceIconCard(icon: Icons.local_pharmacy, label: "মেডিসিন"),
                  ServiceIconCard(icon: Icons.More_horiz, label: "আরও সেবা"),
                ],
              ),
              const SizedBox(height: 30),

              // বিভিন্ন প্যানেলে যাওয়ার শর্টকাট বাটনসমূহ
              const Text(
                "অ্যাপ প্যানেলসমূহ (টেস্টিং শর্টকাট)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 12),

              // রাইডার প্যানেলে যাওয়ার বাটন
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RiderScreen()),
                    );
                  },
                  icon: const Icon(Icons.directions_bike, color: Colors.white),
                  label: const Text("রাইডার প্যানেলে যান", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),

              // মার্চেন্ট প্যানেলে যাওয়ার বাটন
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MerchantScreen()),
                    );
                  },
                  icon: const Icon(Icons.store, color: Colors.white),
                  label: const Text("মার্চেন্ট প্যানেলে যান", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),

              // অ্যাডমিন প্যানেলে যাওয়ার বাটন
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AdminScreen()),
                    );
                  },
                  icon: const Icon(Icons.admin_panel_settings, color: Colors.white),
                  label: const Text("অ্যাডমিন প্যানেলে যান", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// সার্ভিস আইকন কার্ড উইজেট
class ServiceIconCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const ServiceIconCard({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.green),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
