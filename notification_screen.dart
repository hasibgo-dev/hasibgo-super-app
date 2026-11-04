import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // নোটিফিকেশন তালিকার ডেটা
  List> notifications = [
    {
      "title": "অর্ডার সফল হয়েছে!",
      "message": "আপনার ফুড অর্ডার #১০১ সফলভাবে মার্চেন্টের কাছে পৌঁছে গেছে।",
      "time": "১০ মিনিট আগে",
      "icon": "order"
    },
    {
      "title": "বিশেষ ডিসকাউন্ট অফার!",
      "message": "আজ রাইড শেয়ারিংয়ে পাচ্ছেন ২০% পর্যন্ত ক্যাশব্যাক।",
      "time": "১ ঘণ্টা আগে",
      "icon": "offer"
    },
    {
      "title": "রাইডার অ্যাসাইন করা হয়েছে",
      "message": "আপনার ট্রিপের জন্য একজন রাইডার অন্বেষণ করা হয়েছে।",
      "time": "৩ ঘণ্টা আগে",
      "icon": "ride"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HasibGo - নোটিফিকেশন"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              setState(() {
                notifications.clear();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("সব নোটিফিকেশন মুছে ফেলা হয়েছে")),
              );
            },
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                "বর্তমানে কোনো নতুন নোটিফিকেশন নেই",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notif = notifications[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade50,
                      child: const Icon(Icons.notifications_active, color: Colors.green),
                    ),
                    title: Text(
                      notif['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(notif['message']!, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                        const SizedBox(height: 6),
                        Text(
                          notif['time']!,
                          style: const TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.close, size: 18, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          notifications.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
