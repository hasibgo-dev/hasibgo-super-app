import 'package:flutter/material.dart';

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({super.key});

  @override
  State<MerchantScreen> createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  // স্টোর খোলা বা বন্ধ থাকার স্ট্যাটাস
  bool isStoreOpen = true;

  // লাইভ নতুন অর্ডারের তালিকা (ডাইনামিক ডেটা)
  List> incomingOrders = [
    {"orderId": "অর্ডার #১০১", "customerName": "নাসির উদ্দিন", "items": "২x চিকেন বিরিয়ানি"},
    {"orderId": "অর্ডার #১০২", "customerName": "রহিম খান", "items": "১x লার্জ পিজ্জা"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HasibGo - মার্চেন্ট প্যানেল"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // স্টোর স্ট্যাটাস কার্ড
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "স্টোর স্ট্যাটাস",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          isStoreOpen ? "স্টোর বর্তমানে খোলা আছে (অর্ডার গ্রহণ করা হচ্ছে)" : "স্টোর বর্তমানে বন্ধ আছে",
                          style: TextStyle(
                            fontSize: 12,
                            color: isStoreOpen ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      value: isStoreOpen,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          isStoreOpen = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "নতুন অর্ডারসমূহ (লাইভ)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),

            // অর্ডার লিস্ট বা কার্ড
            Expanded(
              child: isStoreOpen
                  ? incomingOrders.isEmpty
                      ? const Center(child: Text("বর্তমানে কোনো নতুন অর্ডার নেই"))
                      : ListView.builder(
                          itemCount: incomingOrders.length,
                          itemBuilder: (context, index) {
                            final order = incomingOrders[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.shopping_bag, color: Colors.green, size: 30),
                                title: Text(
                                  "${order['orderId']} - ${order['customerName']}",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text("আইটেম: ${order['items']}"),
                                trailing: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  ),
                                  onPressed: () {
                                    // অর্ডার গ্রহণ করার লজিক
                                    setState(() {
                                      incomingOrders.removeAt(index);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("অর্ডারটি সফলভাবে গ্রহণ করা হয়েছে!")),
                                    );
                                  },
                                  child: const Text("গ্রহণ করুন", style: TextStyle(color: Colors.white, fontSize: 12)),
                                ),
                              ),
                            );
                          },
                        )
                  : const Center(
                      child: Text(
                        "আপনার স্টোর বন্ধ থাকায় কোনো অর্ডার দেখা যাচ্ছে না।",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
